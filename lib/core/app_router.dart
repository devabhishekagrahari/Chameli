import 'package:flutter/material.dart';
import 'package:untitled1/views/home_screen.dart';
import 'package:untitled1/views/add_question_screen.dart';
import 'package:untitled1/views/view_questions_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/add-question':
        return MaterialPageRoute(builder: (_) => const AddQuestionScreen());
      case '/view-questions':
        return MaterialPageRoute(builder: (_) => const ViewQuestionsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
