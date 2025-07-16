import 'package:flutter/material.dart';
import 'package:todolist_app/screens/login.dart';
import 'package:todolist_app/screens/sign_up.dart';

class Auth_Page extends StatefulWidget {
  const Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

class _Auth_PageState extends State<Auth_Page> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LoginScreen(show: to);
    } else {
      // Replace this with your actual alternative widget, e.g., RegisterScreen()
      return SignUpScreen(show: to);
    }
  }
}
