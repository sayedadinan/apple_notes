class NoteModel {
  int? id;
  final String title;
  final String notes;
  final String date;

  NoteModel({
    this.id,
    required this.title,
    required this.notes,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'notes': notes,
      'date': date,
    };
  }

  static NoteModel fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      notes: map['notes'],
      date: map['date'],
    );
  }
}
