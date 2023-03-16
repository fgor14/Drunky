import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import 'package:flutter_pw/model/drink.dart';
import 'package:flutter_pw/model/user.dart';


class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;
  NotesDatabase._init(); 
  
  //connessione + creazione db

  Future<Database> get database async {
    if (_database != null) return _database!;

  //Creazione db

  _database = await _initDB("app.db");
  return _database!;
  
  }


  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    //se aggiungiamo nuovi campi basta fare onUpgrade
    return await openDatabase(path , version : 1, onCreate: _createDB);
  }

  //creazione db da fare //UserFields 
  Future _createDB (Database db, int version) async {

    final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final integerType = "INTEGER";
    final textType = "TEXT NOT NULL";

    await db.execute('''
    CREATE TABLE $tableDrink (
      ${DrinkFields.id} $idType,
      ${DrinkFields.name} $textType,
      ${DrinkFields.description} $textType,
      ${DrinkFields.recipe} $textType,
    )
    ''');

    await db.execute('''
     CREATE TABLE $tableUser (
      ${UserFields.id} $idType,
      ${UserFields.password} $textType,
      ${UserFields.username} $textType,
      ${UserFields.created} $integerType,
      ${UserFields.liked} $integerType,
     )
    ''');
  }

   Future close() async {
    final db = await instance.database;
    db.close();
  }
}