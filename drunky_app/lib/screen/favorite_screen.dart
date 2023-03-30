import 'package:flutter/material.dart';

import '../widgets/vertical_list_item.dart';

class Favorite extends StatelessWidget {
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
              modify: false,
            ),
            VerticalListItem(
              srcProfile:
                  "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
              name: "Mojito",
              recipe: ["rum", "lemon juice"],
              description: "mescolare",
              modify: false,
            ),
            VerticalListItem(
              srcProfile:
                  "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
              name: "Mojito",
              recipe: ["rum", "lemon juice"],
              description: "mescolare",
              modify: false,
            ),
          ]),
    );
  }
}