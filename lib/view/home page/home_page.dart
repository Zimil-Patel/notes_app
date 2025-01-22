import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log("Home building -----------------");

    return Scaffold(
      // APPBAR
      appBar: _buildHomeAppBar(context),

      // BODY
      body: Column(
        children: [
          // NOTES LIST
          Consumer<NoteProvider>(builder: (context, provider, child) {

            log("ListView building -------");

            return Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  provider.notes.length,
                  (index) {
                    return _buildNote(context: context);
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// home app bar
AppBar _buildHomeAppBar(BuildContext context) {
  return AppBar(
    centerTitle: false,
    backgroundColor: Colors.transparent,
    title: Text('Note Manager'),
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

// Note card
_buildNote({required BuildContext context}) {
  return Card(
    color: Theme.of(context).colorScheme.secondary,
    margin: EdgeInsets.all(defPadding),
    child: ListTile(
      leading: Icon(Icons.note_alt_outlined),

      // title
      title: Text('Title'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // note
          Text('note'),

          // created date
          Text('22 Jan 25'),

          // created time
          Text('10:00 AM'),
        ],
      ),

      // delete note icon
      trailing: Icon(Icons.delete_outline_rounded),
    ),
  );
}
