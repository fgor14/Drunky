import 'package:drunky_app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:drunky_app/screen/login_page.dart';
import 'package:drunky_app/screen/_registerPage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';




class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Image.asset('assets/images/logo.png', height: 25.0),
          centerTitle: true,
          actions: [
            SizedBox(
              height: 25,
              width: 100,
              child: IconButton(
                iconSize: 18.0,
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          RegisterPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                icon: Text('Registrati'),
              ),
            ),
          ],

      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == "") {
                    return 'Inserisci la tua email email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic)
                ),
              ),
              SizedBox(height: 50.0),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == "") {
                    return 'Inserisci la tua password';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: 
                     MaterialStateProperty.all<Color>(Colors.green),

                  ),
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
      MaterialPageRoute(builder: (context) => MyHomePage()),
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
          MaterialPageRoute(builder: (context) => MyHomePage()),
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
