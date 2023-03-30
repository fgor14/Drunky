import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drunky',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _recipeController = TextEditingController();

  final CollectionReference _products = FirebaseFirestore.instance.collection('drinks');

  final List<Card> _cards = [];
  
  Future<Card> _read([DocumentSnapshot? documentSnapshot]) async {
            if (documentSnapshot == null) {
            print('documentSnapshot is null');
            return Card(); // oppure restituire un messaggio di errore o una card vuota
            }
            if (!documentSnapshot.exists) {
            print('documentSnapshot does not exist');
            return Card(); // oppure restituire un messaggio di errore o una card vuota
            }
            return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                     title: Text((documentSnapshot.data() as Map<String, dynamic>)['name'] ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                        (documentSnapshot.data() as Map<String, dynamic>)['image'] ?? '',
                        height: 150,
                        fit: BoxFit.cover,),
                        Text((documentSnapshot.data() as Map<String, dynamic>)['description'] ?? ''),
                        Text((documentSnapshot.data() as Map<String, dynamic>)['recipe'] ?? ''),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,
                       child: Row(),
                        //rinserire le due icone per delete e update
                      // ),
                    ),
                  ),
                );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Drunky')),
      ),
      body: ListView(
        children: _cards,
      ),
    //btn read
      floatingActionButton: FloatingActionButton(
      onPressed: () async {
      
      //Filtro per campo
       DocumentSnapshot? firstDocument = await _products.where('name', isEqualTo: 'Rosemary Blue2').limit(1).get().then((querySnapshot) {
      //    return querySnapshot.docs.first;
      // });
      
      //DocumentSnapshot? firstDocument =  await  _products.limit(1).get().then((querySnapshot) {
      
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first;
      } else {
        return null;
      }
    });
     if (firstDocument != null) {
      print('calling _read() with documentSnapshot:');
      print(firstDocument.data());
      _cards.add(await _read(firstDocument));
      setState(() {
      });
      
    } else {
      print('no documents found');
    }
  },
  child: const Icon(Icons.add),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  
  }

}

