import 'dart:convert';

import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import 'package:flutter_pw/model/drink.dart';
import 'package:flutter_pw/model/user.dart';


class DrinksDatabase {
  static final DrinksDatabase instance = DrinksDatabase._init();

  static Database? _database;
  DrinksDatabase._init(); 
  
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
  
  Future <Drink> createDrink (Drink drink) async {
    final db = await instance.database; 
    final id = await db.insert(tableDrink , drink.toJson()  );
    return drink.copy(id: id);
  }

  Future <User> createUser (User user) async {
    final db = await instance.database;
    final id = await db.insert(tableUser , user.toJson()  );
    return user.copy(id: id);
  }

  Future <Drink> readDrink (int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDrink,
      columns: DrinkFields.values,
      // se vogliamo recuperare più campi aggiungere ? e nuovo args
      where: '${DrinkFields.id} = ?',
      //whereArgs: [id, ...], così fa prevenzione su sql inject
      whereArgs: [id],
     );

  // db query restituisce una list di json,
  //leggendo una sola note possiamo usare il maps.first
    if (maps.isNotEmpty) {
      return Drink.fromJson(maps.first);
    } else {
      throw Exception("ID del drink $id non trovato!");
    }
  }

  Future <User> readUser (int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUser,
      columns: UserFields.values,
      // se vogliamo recuperare più campi aggiungere ? e nuovo args
      where: '${UserFields.id} = ?',
      //whereArgs: [id, ...], così fa prevenzione su sql inject
      whereArgs: [id],
     );

      if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception("ID dello user $id non trovato!");
    }
  }


  Future<List<Drink>> readAllDrink() async {
    final db = await instance.database;
    final orderBy = '${DrinkFields.name} ASC';
     final result = await db.query(tableDrink, orderBy: orderBy );
    // final result = await db.query(tableDrink,orderBy: ,where:  );
    return result.map((json) => Drink.fromJson(json)).toList();
  }

  Future<List<User>> readAllUser() async {
    final db = await instance.database;
    final orderBy = '${UserFields.created} ASC';
    final result = await db.query(tableUser, orderBy: orderBy);
    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> update(Drink drink) async {
    final db = await instance.database;

    return db.update(
      tableDrink,
      drink.toJson(),
      where: "${DrinkFields.id} = ?",
      whereArgs: [drink.id],
    );
  }

  Future<int> delete (int id) async {
    final db = await instance.database;

    return await db.delete(
      tableDrink,
      where: "${DrinkFields.id} = ?",
      whereArgs: [id],
    );
  }

   Future close() async {
    final db = await instance.database;
    db.close();
  }
}