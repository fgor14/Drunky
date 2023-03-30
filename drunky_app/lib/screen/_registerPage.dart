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
                      decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(fontStyle: FontStyle.italic)),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value))
                          return "Puoi utilizzare solo caratteri o numeri";
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontStyle: FontStyle.italic)),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value))
                          return "Puoi utilizzare solo caratteri o numeri";
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Ripeti la password',
                          labelStyle: TextStyle(fontStyle: FontStyle.italic)),
                      validator: (value) {}),
                ),
                Row(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                Size.fromWidth(310.0)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: Text('Register'),
                          onPressed: () {}),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
