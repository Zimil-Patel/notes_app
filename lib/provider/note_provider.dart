
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/note_model.dart';
import '../services/database_service.dart';

class NoteProvider with ChangeNotifier {
  List<NoteModel> _notes = [];
  List<NoteModel> get notes => _notes;

  bool _isNotesInitialized = false;

  // CONSTRUCTOR
  NoteProvider(){
    initializeNotes();
  }

  // initialize notes
  void initializeNotes(){
    if(!_isNotesInitialized){
      _isNotesInitialized = true;
      getAllNotes();
    }
  }

  // GET ALL NOTES
  Future<List<NoteModel>> getAllNotes() async {
    // log("Called get all notes");
    final data = await DatabaseService.databaseService.readAllRecord();
    _notes = data.map((e) => NoteModel.fromFirebase(e)).toList();
    notifyListeners();
    return notes;
  }

  //  ADD NOTE
  Future<void> addNote(String title,String note) async {
    if(title.isNotEmpty && note.isNotEmpty){
      final dateTime = DateTime.now();
      final date = DateFormat.yMMMd().format(dateTime);
      final time = DateFormat.jm().format(dateTime);

      NoteModel noteModel =
      NoteModel(id: 1, title: title, note: note, date: date, time: time);

      await DatabaseService.databaseService.insertRecord(noteModel);

      getAllNotes();
      // txtTitle.clear();
      // txtNote.clear();
    }
  }

  //  DELETE NOTE
  Future<void> deleteNote(int id) async {
    await DatabaseService.databaseService.deleteRecord(id);
    getAllNotes();
  }

  //  UPDATE NOTE
  Future<void> updateNote(NoteModel model, String title, note) async {
    model.title = title;
    model.note = note;
    model.title = title;
    model.note = note;

    await DatabaseService.databaseService.updateRecord(model);

    getAllNotes();
  }
}
