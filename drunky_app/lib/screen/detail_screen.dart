import 'package:flutter/material.dart';

import 'create_drink_screen.dart';

class DetailScreen extends StatelessWidget {
  final String srcProfile;
  final String name;
  final String description;
  final List<String> recipe;
  final bool modify;

  const DetailScreen(
      {super.key,
      required this.srcProfile,
      required this.name,
      required this.description,
      required this.recipe,
      required this.modify});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Image.asset('assets/images/logo.png', height: 25.0),
          centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(15),
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image(
                fit: BoxFit.contain,
                image: NetworkImage(srcProfile),
              ),
            ),
            ListTile(
                title: Text(name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black, fontSize: 35)),
                trailing: const Icon(Icons.favorite_border_outlined)),
            const Divider(
              color: Colors.green,
            ),
            const Text("Ingredienti:",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 15)),
            Column(
                children: recipe
                    .map((String e) => Text(e,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 25)))
                    .toList()),
            const Divider(
              color: Colors.green,
            ),
            const Text("Ricetta:",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 15)),
            Text(description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 25))
          ],
        ),
        floatingActionButton: Visibility(
            visible: modify,
            child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateDrinkScreen(modify:modify))),
                child: Icon(Icons.mode_edit_outline_outlined))));
  }
}
