import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';
import 'package:todolist_app/model/notes_model.dart';

class Firestore_Datasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> CreateUser(String email) async {
    try {
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        "id": _auth.currentUser!.uid,
        "email": email,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> AddNote(String subtitle, String title, int image) async {
    try {
      var uuid = Uuid().v4();
      DateTime data = DateTime.now();
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc()
          .set({
            "id": uuid,
            "title": title,
            "subtitle": subtitle,
            "image": image,
            "time": '${data.hour}:${data.minute}',
            "isDone": false,
          });
      return true;
    } catch (e) {
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    try {
      final noteList = snapshot.data.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>; // ✅ define data

        return Note(
          data['id'],
          data['title'],
          data['subtitle'],
          data['image'],
          data['time'],
          data['isDone'] ?? false, // ✅ handle isDone with a default value
        );
      }).toList();

      return noteList;
    } catch (e) {
      return [];
    }
  }

  Stream<QuerySnapshot> getNotesStream() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('notes')
        .snapshots();
  }

  Future<bool> idDone(String uuid, bool isDone) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({"isDone": isDone});
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> Update_Note(
    String uuid,
    String title,
    String subtitle,
    int image,
  ) async {
    try {
      DateTime data = DateTime.now();
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({
            "title": title,
            "subtitle": subtitle,
            "image": image,
            "time": '${data.hour}:${data.minute}',
          });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }
}
