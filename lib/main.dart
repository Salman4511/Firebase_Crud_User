import 'package:auth_app_user/controller/user_db_helper.dart';
import 'package:auth_app_user/view/authentication/login_screen.dart';
import 'package:auth_app_user/view/authentication/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCxNCA4WpWpH_HD3c5UWoOZinHgozsIjgI",
      appId: "1:723235300746:android:a782afc372c58746ea9473",
      messagingSenderId: '723235300746',
      projectId: 'flutter-firebase-auth-4d195',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Authpage(),
    );
  }
}

