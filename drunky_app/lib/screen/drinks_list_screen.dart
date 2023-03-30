import 'package:flutter/material.dart';

import '../widgets/vertical_list_item.dart';

class Drinks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      scrollDirection: Axis.vertical,
      children: const [
        Text("Drink Classici",          
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 30)
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child:const Divider(
              color: Colors.green,
            ),
        ),
        VerticalListItem(
              srcProfile:
                  "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
              name: "Mojito",
              recipe: ["rum", "lemon juice"],
              description: "mescolare",
              modify: false,),
        VerticalListItem(
              srcProfile:
                  "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
              name: "Mojito",
              recipe: ["rum", "lemon juice"],
              description: "mescolare",
              modify: false,),
        VerticalListItem(
              srcProfile:
                  "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
              name: "Mojito",
              recipe: ["rum", "lemon juice"],
              description: "mescolare",
              modify: false,),
      ],);
  }
}
