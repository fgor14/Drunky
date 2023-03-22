import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:sqflite_database_example/model/note.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];
/*
class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;
*/
  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    //final color = _lightColors[index % _lightColors.length];
    final color = _lightColors[ _lightColors.length];
    
    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ciao"
              //style: TextStyle(color: Colors.grey.shade700),
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }