import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/core/app_router.dart';
import 'package:untitled1/core/app_theme.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
   await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: "AIzaSyAnMC7yPR5JOTpwR5JWV2HhMDXizRZjeXk",
        authDomain: "question-bank-app-fl.firebaseapp.com",
        projectId: "question-bank-app-fl",
        storageBucket: "question-bank-app-fl.firebasestorage.app",
        messagingSenderId: "460887307044",
        appId: "1:460887307044:web:d8d4d90fa80bebdf9739b1",
        measurementId: "G-DJPPSL4B40"
    ));
  }else {
   await Firebase.initializeApp();
  }
//void main() async {
 // WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Question Bank',
      theme: AppTheme.darkTheme,
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
