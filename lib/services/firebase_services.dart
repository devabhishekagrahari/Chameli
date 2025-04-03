import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/models/question.dart';

class FirebaseService {
  final CollectionReference _questionCollection =
  FirebaseFirestore.instance.collection('questions');

  Future<void> addQuestion(Question question) async {
    try {
      await _questionCollection.doc(question.id).set(question.toJson());
      print("✅ Question added successfully!");
    } catch (e) {
      print("❌ Error adding question: $e");
    }
  }
}
