import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/models/question.dart';

class FirebaseService {
  final CollectionReference _questionCollection =
  FirebaseFirestore.instance.collection('questions');

  Stream<List<Question>> getQuestionsStream() {
    return _questionCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Question.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Future<void> addQuestion(Question question) async {
    try {
      await _questionCollection.doc(question.id).set(question.toJson());
      print("✅ Question added successfully!");
    } catch (e) {
      print("❌ Error adding question: $e");
    }
  }
}
