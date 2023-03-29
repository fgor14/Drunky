import 'package:flutter/material.dart';

import '../widgets/vertical_list_item.dart';

class Drinks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        VerticalListItem(srcProfile: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
        name: "Mojito",
        recipe: ["rum chiaro", "succo di lime", "zucchero", "menta", "soda"],
        description: "Pestare le foglie di menta con lo zucchero e il succo di lime. Aggiungere una spruzzata di acqua di seltz e riempi il bicchiere con ghiaccio tritato. Versare il rum e riempire con acqua di seltz. Guarnire con una fetta di lime, servire con una cannuccia."),
        VerticalListItem(srcProfile: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
        name: "Mojito",
        recipe: ["rum chiaro", "succo di lime", "zucchero", "menta", "soda"],
        description: "Pestare le foglie di menta con lo zucchero e il succo di lime. Aggiungere una spruzzata di acqua di seltz e riempi il bicchiere con ghiaccio tritato. Versare il rum e riempire con acqua di seltz. Guarnire con una fetta di lime, servire con una cannuccia."),
        VerticalListItem(srcProfile: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
        name: "Mojito",
        recipe: ["rum chiaro", "succo di lime", "zucchero", "menta", "soda"],
        description: "Pestare le foglie di menta con lo zucchero e il succo di lime. Aggiungere una spruzzata di acqua di seltz e riempi il bicchiere con ghiaccio tritato. Versare il rum e riempire con acqua di seltz. Guarnire con una fetta di lime, servire con una cannuccia."),
      ],);
  }
}
