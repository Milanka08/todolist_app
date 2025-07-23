import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todolist_app/auth/auth_page.dart';
import 'package:todolist_app/auth/main_page.dart';
import 'package:todolist_app/screens/add_note_screen.dart';
import 'package:todolist_app/screens/home.dart';
import 'package:todolist_app/screens/login.dart';
import 'package:todolist_app/screens/sign_up.dart';
import 'package:todolist_app/widgets/task_widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Main_Page());
  }
}
