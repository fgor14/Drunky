import 'package:drunky_app/screen/create_screen.dart';
import 'package:flutter/material.dart';

class CreateDrinkScreen extends StatefulWidget {
  final bool modify;

  CreateDrinkScreen(
    {super.key,
    required this.modify});

  @override
  State<CreateDrinkScreen> createState() => _CreateDrinkScreenState();
}

class _CreateDrinkScreenState extends State<CreateDrinkScreen> {
  final createKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Image.asset('assets/images/logo.png', height: 25.0),
        centerTitle: true,
      ),
      body:Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: createKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Creazione/Modifica Drink',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Nome del drink'),
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
                          InputDecoration(labelText: 'Ingerdienti'),
                      validator: (value) {
                        if (value!.isEmpty ||
                            RegExp(r'^[a-z A-Z] + @ + . [0-9] +$')
                                .hasMatch(value)) return "Metti il nome giusto";
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Ricetta'),
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
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child: const Text('Crea/Modifica'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Visibility(
                      visible: widget.modify,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        child: const Text('Elimina'),
                        onPressed: () => Navigator.pop(context),
                      )
                      )
                    
                  ],
                )
              ],
            ),
          ),
        )
      );
  }
}