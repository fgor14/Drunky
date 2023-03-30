import 'package:drunky_app/widgets/horizontal_list_item.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key, /* required this.data, */required this.title});

  final String title;

  @override
  Widget build(BuildContext context){

    return Padding(
      padding: const EdgeInsets.symmetric(vertical:2.0),
      child: Column(children: [
        Text(title,          
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.black, fontSize: 30)
        ), 
        Container(
          color: Colors.grey[300],
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 250.0 ,
          child:ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
              children: const [
                HorizontalListItem(srcProfile: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
                name: "Mojito",
                recipe: ["rum chiaro", "succo di lime", "zucchero", "menta", "soda"],
                description: "Pestare le foglie di menta con lo zucchero e il succo di lime. Aggiungere una spruzzata di acqua di seltz e riempi il bicchiere con ghiaccio tritato. Versare il rum e riempire con acqua di seltz. Guarnire con una fetta di lime, servire con una cannuccia.",
                modify: false),
                HorizontalListItem(srcProfile: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
                name: "Mojito",
                recipe: ["rum chiaro", "succo di lime", "zucchero", "menta", "soda"],
                description: "Pestare le foglie di menta con lo zucchero e il succo di lime. Aggiungere una spruzzata di acqua di seltz e riempi il bicchiere con ghiaccio tritato. Versare il rum e riempire con acqua di seltz. Guarnire con una fetta di lime, servire con una cannuccia.",
                modify: false),
                HorizontalListItem(srcProfile: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
                name: "Mojito",
                recipe: ["rum chiaro", "succo di lime", "zucchero", "menta", "soda"],
                description: "Pestare le foglie di menta con lo zucchero e il succo di lime. Aggiungere una spruzzata di acqua di seltz e riempi il bicchiere con ghiaccio tritato. Versare il rum e riempire con acqua di seltz. Guarnire con una fetta di lime, servire con una cannuccia.",
                modify: false)
                ],
            // children: data.map((e) {
            //   return const HomeListItem(
            //     srcProfile: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
            //     name: "Mojito",
            //     recipe: ["rum", "lemon juice"],
            //     description: "mescolare",
            //   );
            // }).toList()
          ),
        )
      ]),
    );
  }
}