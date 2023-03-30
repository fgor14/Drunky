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
          title: Image.asset('assets/images/logo.png', height: 25.0),
          centerTitle: true,
          actions: [
            SizedBox(
              height: 25,
              width: 100,
              child: IconButton(
                  iconSize: 18.0,
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage())),
                  icon: Text('Registrati')),
            )
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
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Metti email o nome'),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                .hasMatch(value)) return "Metti il nome giusto";
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Metti la password'),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-z A-Z] + @ + . [0-9] +$')
                                .hasMatch(value)) return "Metti il nome giusto";
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
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> MyHomePage())),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
