import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addQuestion({
    required String questionText,
    required String subject,
    required String difficulty,
    required List<String> options,
    required String correctAnswer,
  }) async {
    try {
      await _firestore.collection('questions').add({
        'questionText': questionText,
        'subject': subject,
        'difficulty': difficulty,
        'options': options,
        'correctAnswer': correctAnswer,
        'createdAt': FieldValue.serverTimestamp(),
      });
    print("✅ Question added successfully!");
    } catch (e) {
      print("❌ Error adding question: $e");
    }
  }
}
