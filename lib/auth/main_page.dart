import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todolist_app/auth/main_page.dart';
import 'package:todolist_app/auth/auth_page.dart';
import 'package:todolist_app/screens/home.dart';

class Main_Page extends StatelessWidget {
  const Main_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home_Page();
          } else {
            return Auth_Page();
          }
        },
      ),
    );
  }
}
