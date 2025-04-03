import 'package:flutter/material.dart';
import 'package:untitled1/models/question.dart';
import 'package:untitled1/services/firebase_services.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _optionController = TextEditingController();
  final TextEditingController _createdByController =
  TextEditingController(text: "admin"); // Editable now
  final List<String> _options = [];
  String _selectedDifficulty = 'Easy';
  String _selectedType = 'MCQ';

  final FirebaseService _firebaseService = FirebaseService(); // Firebase Instance

  void _saveQuestion() {
    final question = Question(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      question: _questionController.text,
      options: _selectedType == "MCQ" ? _options : null,
      answer: _answerController.text,
      type: _selectedType,
      category: _categoryController.text,
      difficulty: _selectedDifficulty,
      createdBy: _createdByController.text,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );

    _firebaseService.addQuestion(question);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Question saved to Firestore!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Let's Add Question")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Enter Question", _questionController),
              _buildTextField("Enter Answer", _answerController),
              _buildTextField("Enter Category", _categoryController),
              _buildDropdown("Select Difficulty", _selectedDifficulty,
                  ['Easy', 'Medium', 'Hard'], (value) {
                    setState(() => _selectedDifficulty = value!);
                  }),
              _buildDropdown("Select Type", _selectedType,
                  ['MCQ', 'Short Answer', 'True/False'], (value) {
                    setState(() => _selectedType = value!);
                  }),
              if (_selectedType == "MCQ") _buildTextField("Add Option", _optionController),
              if (_selectedType == "MCQ")
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_optionController.text.isNotEmpty) {
                        setState(() {
                          _options.add(_optionController.text);
                          _optionController.clear();
                        });
                      }
                    },
                    child: const Text("Add Option"),
                  ),
                ),
              if (_selectedType == "MCQ")
                Wrap(
                  children:
                  _options.map((option) => Chip(label: Text(option))).toList(),
                ),
              _buildTextField("Created By", _createdByController), // Editable now
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _saveQuestion,
                  child: const Text("Save Question"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller,
      {bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String label, String value, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          DropdownButton<String>(
            value: value,
            onChanged: onChanged,
            items: items.map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
