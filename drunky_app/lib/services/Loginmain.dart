import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('Bentornato Federico!'),
      ),
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drunky'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == "") {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == "") {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _loginWithEmailAndPassword(context);
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  Future<void> _loginWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('Login successful: ${userCredential.user!.email}');
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomePage()),
    );


      // Esegui l'azione desiderata
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      QuerySnapshot snapshot = await users.where('email', isEqualTo: _emailController.text).get();
      if (snapshot.docs.length > 0) {
        DocumentSnapshot user = snapshot.docs.first;
        // Fai qualcosa con i dati dell'utente loggato

        // Reindirizza l'utente alla pagina Home dopo il login
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
      print('Login successful: ${userCredential.user!.email}');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Gestisci l'errore utente non trovato
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('User not found'),
        ));

        
      } else if (e.code == 'wrong-password') {
        // Gestisci l'errore password errata
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Wrong password'),
        ));
      }
    } catch (e) {
      // Gestisci gli errori generici


      // Gestisci gli errori generici
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occurred'),
      ));
    }
  }
}



