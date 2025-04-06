class Question {
  final String id;
  final String question;
  final List<String>? options; // Only for MCQs
  final String answer;
  final String type; // "MCQ", "Short Answer", "Long Answer", "Diagram"
  final String category;
  final String difficulty; // "Easy", "Medium", "Hard"
  final String? imageUrl; // Optional for diagram-based questions
  final String createdBy;
  final int timestamp; // Stored as milliseconds since epoch

  Question({
    this.id = '',
    this.question = '',
    this.options,
    this.answer = '',
    this.type = 'MCQ',
    this.category = '',
    this.difficulty = '',
    this.imageUrl,
    this.createdBy = '',
    int? timestamp, // Optional param to allow default value
  }) : timestamp = timestamp ?? DateTime.now().millisecondsSinceEpoch;

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] ?? '',
      question: json['question'] ?? '',
      options: (json['options'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      answer: json['answer'] ?? '',
      type: json['type'] ?? 'MCQ',
      category: json['category'] ?? '',
      difficulty: json['difficulty'] ?? '',
      imageUrl: json['imageUrl'],
      createdBy: json['createdBy'] ?? '',
      timestamp: json['timestamp'] ?? DateTime.now().millisecondsSinceEpoch,
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'answer': answer,
      'type': type,
      'category': category,
      'difficulty': difficulty,
      'imageUrl': imageUrl,
      'createdBy': createdBy,
      'timestamp': timestamp,
    };
  }
}
