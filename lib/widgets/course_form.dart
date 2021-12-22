// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CourseForm extends StatefulWidget {
  @override
  _CourseFormState createState() => _CourseFormState();
}

class _CourseFormState extends State<CourseForm> {
  final _controller = TextEditingController();
  var _selectedCouse = '';
  void _sendCourse() async{
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    // final userData = await Firestore.instance.collection('users').document(user.uid).get();
    Firestore.instance.collection('courses').add({
      'course': _selectedCouse,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
    });
    _controller.clear();
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(height: 30),
          TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Course',
                prefixIcon: const Icon(Icons.book_outlined),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedCouse = value;
                });
              },
            ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _selectedCouse.trim().isEmpty ? null: _sendCourse,
            child: Text('Add', style: TextStyle(fontSize: 23),),
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
              shadowColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          ),
        ],
      ),
    );
  }
  }
