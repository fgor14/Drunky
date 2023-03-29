import 'package:drunky_app/widgets/horizontal_list.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical:3),
      children: [
        HorizontalList(title: "Le scelte del giorno"),
        HorizontalList(title: "Gin"),
        HorizontalList(title: "Vodka"),
        HorizontalList(title: "Rum"),
        HorizontalList(title: "Tequila")
      ]
    );
  }
}