import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todolist_app/const/colors.dart';
import 'package:todolist_app/data/firestore.dart';
import 'package:todolist_app/screens/add_note_screen.dart';
import 'package:todolist_app/screens/home.dart';
import 'package:todolist_app/widgets/task_widgets.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

bool show = true;

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Add_Screen()));
          },
          backgroundColor: custom_purple,
          child: Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            return true;
          },
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore_Datasource().getNotesStream(),
            builder: (context, Snapshot) {
              if (!Snapshot.hasData) {
                return CircularProgressIndicator();
              }
              final noteList = Firestore_Datasource().getNotes(Snapshot);
              return ListView.builder(
                itemBuilder: (context, index) {
                  final note = noteList[index];
                  return Task_Widget(note);
                },
                itemCount: noteList.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
