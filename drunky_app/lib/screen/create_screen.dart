import 'package:drunky_app/screen/create_drink_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/vertical_list_item.dart';

class CreateScreen extends StatelessWidget {
  var drinksCreated = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          scrollDirection: Axis.vertical,
          children: [
            VerticalListItem(
              srcProfile:
                  "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
              name: "Mojito",
              recipe: ["rum", "lemon juice"],
              description: "mescolare",
              modify: true,
            ),
            VerticalListItem(
              srcProfile:
                  "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
              name: "Mojito",
              recipe: ["rum", "lemon juice"],
              description: "mescolare",
              modify: true,
            ),
            VerticalListItem(
              srcProfile:
                  "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
              name: "Mojito",
              recipe: ["rum", "lemon juice"],
              description: "mescolare",
              modify: true,
            ),
          ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateDrinkScreen(modify:false))),
          child: Icon(Icons.add)),
    );
  }
}
