import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist_app/data/firestore.dart';
import 'package:todolist_app/widgets/task_widgets.dart';
import '../data/firestore.dart';

class Stream_note extends StatelessWidget {
  bool done;
  Stream_note(this.done, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore_Datasource().stream(done),
      builder: (context, Snapshot) {
        if (!Snapshot.hasData) {
          return CircularProgressIndicator();
        }
        final noteList = Firestore_Datasource().getNotes(Snapshot);
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final note = noteList[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                Firestore_Datasource().Delet_Note(note.id);
              },
              child: Task_Widget(note),
            );
          },
          itemCount: noteList.length,
        );
      },
    );
  }
}
