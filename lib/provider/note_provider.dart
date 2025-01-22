import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/note_model.dart';
import '../services/database_service.dart';
import '../utils/constants.dart';

class NoteProvider with ChangeNotifier {
  List<NoteModel> _notes = [];
  List<NoteModel> get notes => _notes;

  // GET ALL NOTES
  Future<void> getAllNotes() async {
    log("Called get all notes");
    final data = await DatabaseService.databaseService.readAllRecord();
    _notes = data.map((e) => NoteModel.fromFirebase(e)).toList();
  }

  //  ADD NOTE
  Future<void> addNote() async {
    final title = "Note";
    final note = "My Note";
    final dateTime = DateTime.now();
    final date = DateFormat.yMMMd().format(dateTime);
    final time = DateFormat.jm().format(dateTime);

    NoteModel noteModel =
    NoteModel(id: 1, title: title, note: note, date: date, time: time);

    await DatabaseService.databaseService.insertRecord(noteModel);

    getAllNotes();
    txtTitle.clear();
    txtNote.clear();
    notifyListeners();
  }

  //  DELETE NOTE
  Future<void> deleteNote(int id) async {
    await DatabaseService.databaseService.deleteRecord(id);
    notifyListeners();
  }

  //  UPDATE NOTE
  Future<void> updateNote(NoteModel model) async {
    final title = txtTitle.text;
    final note = txtNote.text;
    model.title = title;
    model.note = note;

    await DatabaseService.databaseService.updateRecord(model);

    notifyListeners();
  }
}
