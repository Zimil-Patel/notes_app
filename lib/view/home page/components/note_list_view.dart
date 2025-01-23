
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/note_model.dart';
import '../../../provider/note_provider.dart';
import '../../../utils/constants.dart';

class NotesListView extends StatelessWidget {
  final List<NoteModel> noteList;

  const NotesListView({super.key, required this.noteList});

  @override
  Widget build(BuildContext context) {

    // log("NotesListView building ----------");

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: defPadding / 1.2),
      physics: BouncingScrollPhysics(),
      itemCount: noteList.length,
      itemBuilder: (context, index) {
        return _buildNote(
          context: context,
          note: noteList[index],
        );
      },
    );
  }
}

Widget _buildNote({
  required BuildContext context,
  required NoteModel note,
}) {
  return Card(
    color: Theme.of(context).colorScheme.secondary,
    elevation: 10,
    margin: EdgeInsets.all(8.0),
    child: ListTile(
      leading: Icon(Icons.note_alt_outlined),
      title: Text(note.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.note),
          Text(note.date),
          Text(note.time),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_outline_rounded),
        onPressed: () {
          context.read<NoteProvider>().deleteNote(note.id);
        },
      ),
    ),
  );
}