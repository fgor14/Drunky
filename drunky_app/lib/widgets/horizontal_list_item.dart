import 'package:drunky_app/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class HorizontalListItem extends StatelessWidget {
  final String srcProfile;
  final String name;
  final String description;
  final List <String> recipe;
  
  const HorizontalListItem(
      {super.key,
      required this.srcProfile,
      required this.name,
      required this.description,
      required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Center(
        
        child: Card(
          elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(srcProfile: srcProfile, name: name, description: description, recipe: recipe))
            )
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius:const BorderRadius.vertical(top: Radius.circular(12.0)),
                child: Image(
                  fit: BoxFit.contain,
                  image: NetworkImage(srcProfile),
                  width: 200.0,
                ),
              ),
              Text.rich(TextSpan(text: name, style: const TextStyle(color: Colors.black, fontSize: 20)))
            ],
          ),
        ),
      ),
    );
  }
}   