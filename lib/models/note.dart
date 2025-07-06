import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String id;
  final String text;

  Note({required this.id, required this.text});

  factory Note.fromDoc(DocumentSnapshot doc) {
    return Note(
      id: doc.id,
      text: doc['text'] ?? '',
    );
  }
}