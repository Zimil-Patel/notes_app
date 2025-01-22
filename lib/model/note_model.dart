class NoteModel {
  int id;
  String title, note, date, time;

  NoteModel({
    this.id = 1,
    required this.title,
    required this.note,
    required this.date,
    required this.time,
  });

  factory NoteModel.fromFirebase(Map map) => NoteModel(
    id: map['id'],
    title: map['title'],
    note: map['note'],
    date: map['date'],
    time: map['time'],
  );
}
