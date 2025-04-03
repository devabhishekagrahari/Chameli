import 'package:flutter/material.dart';

class ViewQuestionsScreen extends StatelessWidget {
  const ViewQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("View Questions")),
      body: const Center(child: Text("List of questions will appear here")),
    );
  }
}
