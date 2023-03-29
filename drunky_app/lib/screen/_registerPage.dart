import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Image.asset('assets/images/logo.png', height: 25.0),
          centerTitle: true,
          flexibleSpace: Container(),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text('Registrati', style: TextStyle(fontSize: 30.0)),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Metti il tuo username'),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-z] + [A-Z] + [0-9] +$')
                                .hasMatch(value!))
                          return "L'user name inserito non va bene";
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      obscureText: true,
                      decoration:
                          InputDecoration(labelText: 'Metti la password'),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-z A-Z] + @ + . [0-9] +$')
                                .hasMatch(value!))
                          return "Metti il nome giusto";
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      obscureText: true,
                      decoration:
                          InputDecoration(labelText: 'Ripeti la password'),
                      validator: (value) {}),
                ),
                Row(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size.fromWidth(330)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child: Text('Register'),
                        onPressed: () {})
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
