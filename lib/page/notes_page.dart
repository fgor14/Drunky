import 'package:flutter/material.dart';
import "package:flutter_pw/model/drink.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import "package:flutter_pw/model/user.dart";
import "package:flutter_pw/db/app_db.dart";
import "package:flutter_pw/widget/note_card_widget.dart";

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Drink> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    DrinksDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await DrinksDatabase.instance.readAllDrink();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Drinks',
            style: TextStyle(fontSize: 24),
          ),
          actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        // body: Center(
        //   child: isLoading
        //       ? CircularProgressIndicator()
        //       : notes.isEmpty
        //           ? Text(
        //               'No Drinks found',
        //               style: TextStyle(color: Colors.white, fontSize: 24),
        //             )
        //           : buildNotes(),
        // ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () async {
            // await Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => AddEditNotePage()),
            // );

            refreshNotes();
          },
        ),
      );

  // Widget buildNotes() => StaggeredGridView.countBuilder(
  //       padding: EdgeInsets.all(8),
  //       itemCount: notes.length,
  //       staggeredTileBuilder: (index) => StaggeredTile.fit(2),
  //       crossAxisCount: 4,
  //       mainAxisSpacing: 4,
  //       crossAxisSpacing: 4,
  //       itemBuilder: (context, index) {
  //         final note = notes[index];

  //         return GestureDetector(
  //           onTap: () async {
  //             await Navigator.of(context).push(MaterialPageRoute(
  //               builder: (context) => NoteDetailPage(noteId: note.id!),
  //             ));

  //             refreshNotes();
  //           },
  //           child: NoteCardWidget(note: note, index: index),
  //         );
  //       },
  //     );
}