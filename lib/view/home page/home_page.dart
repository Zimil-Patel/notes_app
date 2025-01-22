import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:provider/provider.dart';
import '../../model/note_model.dart';
import 'components/custom_text_field.dart';
import 'components/note_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log("Home building --------------");

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildHomeAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18),
          // Title text field
          CustomTextField(
            hintText: 'Add title',
            icon: Icons.edit,
            controller: txtTitle,
          ),

          // Note text field
          CustomTextField(
            hintText: 'Add note',
            icon: Icons.edit_note_rounded,
            controller: txtNote,
            maxLine: 4,
          ),
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
          Expanded(
            child: Selector<NoteProvider, List<NoteModel>>(
              selector: (context, provider) => provider.notes,
              builder: (context, noteList, child) {
                log("ListView building -------");
                return NotesListView(noteList: noteList);
              },
            ),
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
        onPressed: () async {
          await context.read<NoteProvider>().addNote();
        },
        icon: Icon(Icons.note_add_outlined),
      ),
    ],
  );
}
