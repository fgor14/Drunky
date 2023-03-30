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
      home: HomePage2(),
    );
  }
}

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _recipeController = TextEditingController();

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('drinks');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nome drink'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Descrizione',
                  ),
                ),
                TextField(
                  controller: _recipeController,
                  decoration: const InputDecoration(
                    labelText: 'Ricetta',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final String description  = _descriptionController.text;
                    final String recipe = _recipeController.text;


                    if (description != null) {
                        await _products.add({"name": name, "description": description , "recipe": recipe});

                      _nameController.text = '';
                      _descriptionController.text = '';
                      _recipeController.text= '';

                        Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );

        });
  }
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      _nameController.text = documentSnapshot['name'];
      _descriptionController.text = documentSnapshot['description'];
      _recipeController.text = documentSnapshot['recipe'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: "Description",
                    ),
                  ),
                TextField(
                    controller: _recipeController,
                    decoration: const InputDecoration(
                      labelText: "Recipe",
                    ),
                  ),

                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text( 'Update'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final String description = _descriptionController.text;
                    final String recipe = _recipeController.text;
                    if (description != null) {

                        await _products
                            .doc(documentSnapshot!.id)
                            .update({"name": name, "description": description , "recipe": recipe});
                      _nameController.text = '';
                      _descriptionController.text = '';
                      _recipeController.text= "";
                      
                        Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _products.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Hai eliminato un prodotto con successo!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.green,
        title: const Center(child: Text('Drunky Community')),
      ),
      body: StreamBuilder(
        stream: _products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['description']),
                    
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        
                        children: [
                          
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _update(documentSnapshot)),
                          IconButton(
                            
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _delete(documentSnapshot.id)),
                        ],
                        
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
// Add new product
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        
        onPressed: () => _create(),
        child: const Icon(Icons.add),

      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}