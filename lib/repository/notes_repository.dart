import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note.dart';

class NotesRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<List<Note>> fetchNotes(String userId) async {
    final snapshot = await _firestore.collection('users/$userId/notes').get();
    return snapshot.docs.map((doc) => Note.fromDoc(doc)).toList();
  }

  Future<void> addNote(String userId, String text) async {
    await _firestore.collection('users/$userId/notes').add({'text': text});
  }

  Future<void> updateNote(String userId, String id, String text) async {
    await _firestore.doc('users/$userId/notes/$id').update({'text': text});
  }

  Future<void> deleteNote(String userId, String id) async {
    await _firestore.doc('users/$userId/notes/$id').delete();
  }
}
