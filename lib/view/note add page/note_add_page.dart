import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/note_provider.dart';
import 'components/custom_text_field.dart';

class NoteAddPage extends StatelessWidget {
  const NoteAddPage({super.key});

  @override
  Widget build(BuildContext context) {

    var _txtTitle = TextEditingController();
    var _txtNote = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Add Note'),
      ),

      // body
      body: Column(
        children: [
          SizedBox(height: 18),
          // Title text field
          CustomTextField(
            hintText: 'Add title',
            icon: Icons.edit,
            controller: _txtTitle,
          ),

          // Note text field
          CustomTextField(
            hintText: 'Add note',
            icon: Icons.edit_note_rounded,
            controller: _txtNote,
            maxLine: 4,
          ),

          // add button
          ElevatedButton(
            onPressed: () async {
              await context.read<NoteProvider>().addNote(_txtTitle.text, _txtNote.text);
              _txtTitle.clear();
              _txtNote.clear();
            },
            child: Text('Add note'),
          ),
        ],
      ),
    );
  }
}
