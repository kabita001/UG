
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ug_app/widgets/all_feedback_widget.dart';

class AllFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('All Feedback'),
      ),
      body: Container(
        child: Column(
            children: [
              Expanded(child: AllFeedbackWidget()),
            ]
        ),
      ),
    );
  }
}
