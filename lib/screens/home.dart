import 'package:flutter/material.dart';
import 'package:todolist_app/screens/home.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace 'Home' with the correct widget or implement the Home class.
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: const Center(child: Text('Welcome to the Home Page!')),
    );
  }
}
