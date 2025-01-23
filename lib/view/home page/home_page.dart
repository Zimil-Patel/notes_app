import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/view/note%20add%20page/note_add_page.dart';
import 'package:provider/provider.dart';
import '../../model/note_model.dart';
import 'components/note_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log("Home building --------------");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildHomeAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 18),
          // SAVED NOTE TITLE
          Padding(
            padding:
                const EdgeInsets.only(left: defPadding * 1.4, bottom: 10),
            child: Text(
              'Saved Notes',
              style: TextStyle(fontSize: 20),
            ),
          ),

          // SAVED NOTE VIEW
          Selector<NoteProvider, List<NoteModel>>(
            selector: (context, provider) => provider.notes,
            builder: (context, noteList, child) {
              log("ListView building -------");
              return NotesListView(noteList: noteList);
            },
          ),
        ],
      ),
    );
  }
}

// Home app bar
AppBar _buildHomeAppBar(BuildContext context) {
  return AppBar(
    centerTitle: false,
    backgroundColor: Colors.transparent,
    title: Text(
      'Notes Manager',
      style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.034),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NoteAddPage(),));
        },
        icon: Icon(Icons.note_add_outlined),
      ),
    ],
  );
}
