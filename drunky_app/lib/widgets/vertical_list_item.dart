import 'package:flutter/material.dart';

import '../screen/detail_screen.dart';

class VerticalListItem extends StatelessWidget {
  final String srcProfile;
  final String name;
  final String description;
  final List<String> recipe;
  final bool modify;

  const VerticalListItem(
      {super.key,
      required this.srcProfile,
      required this.name,
      required this.description,
      required this.recipe,
      required this.modify});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                      srcProfile: srcProfile,
                      name: name,
                      description: description,
                      recipe: recipe,
                      modify: modify))),
          leading: CircleAvatar(
            radius: 40,
            foregroundImage: NetworkImage(srcProfile),
          ),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: name, style: TextStyle(fontSize: 23)),
              ],
            ),
          ),
          trailing: const Icon(Icons.favorite_border_outlined)),
    );
  }
}
