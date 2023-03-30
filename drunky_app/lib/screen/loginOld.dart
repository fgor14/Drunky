import 'package:drunky_app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:drunky_app/screen/login_page.dart';
import 'package:drunky_app/screen/_registerPage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
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
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email o username',
                          labelStyle: TextStyle(fontStyle: FontStyle.italic)),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                .hasMatch(value)) return "Metti il nome giusto";
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Metti la password',
                          labelStyle: TextStyle(fontStyle: FontStyle.italic)),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-z A-Z] + @ + . [0-9] +$')
                                .hasMatch(value)) return "La password è errata";
                      }),
                ),
                Row(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sign up",
                      style: TextStyle(fontSize: 22),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child: Text('Login'),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    MyHomePage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
