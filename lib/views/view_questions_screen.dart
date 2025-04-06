import 'package:flutter/material.dart';
import 'package:untitled1/models/question.dart';
import 'package:untitled1/services/firebase_services.dart';

class QuestionListScreen extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  QuestionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("📚 All Questions")),
      body: StreamBuilder<List<Question>>(
        stream: _firebaseService.getQuestionsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("❌ Error fetching questions"));
          }
          final questions = snapshot.data ?? [];
          if (questions.isEmpty) {
            return const Center(child: Text("No questions yet"));
          }

          return ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final q = questions[index];
              return Card(
                margin: const EdgeInsets.all(10),
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("🧠 ${q.question}", style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text("📌 Answer: ${q.answer}"),
                      if (q.options != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("🔘 Options:"),
                            ...q.options!.map((opt) => Text("- $opt")),
                          ],
                        ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Chip(label: Text(q.difficulty)),
                          const SizedBox(width: 5),
                          Chip(label: Text(q.type)),
                          const SizedBox(width: 5),
                          Chip(label: Text(q.category)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
