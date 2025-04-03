import 'package:untitled1/models/question.dart';

class QuestionService {
  List<Question> questions = [];

  void addQuestion(Question question) {
    questions.add(question);
  }

  List<Question> getQuestions() {
    return questions;
  }
}
