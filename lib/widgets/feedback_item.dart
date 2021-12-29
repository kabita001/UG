// ignore_for_file: prefer_const_constructors, prefer_if_null_operators, annotate_overrides, overridden_fields, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ug_app/widgets/feedback_view.dart';

class FeedbackItem extends StatefulWidget {
  final String course;
  final String year;
  final String subject;
  final String feedbackType;
  final String comment;
  final String imageUrl;
  final String username;
  final Key key;

  FeedbackItem(this.course, this.year, this.subject, this.feedbackType,
      this.comment, this.imageUrl, this.username,
      {this.key});

  @override
  State<StatefulWidget> createState() {
    return FeedbackItemState();
  }
}

class FeedbackItemState extends State<FeedbackItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => FeedbackView(widget.course, widget.year, widget.subject, widget.feedbackType,
            widget.comment, widget.imageUrl, widget.username)));
            },
            child: ListTile(
              title: Text(
                widget.username,
              ),
              subtitle: Text(widget.subject),
              ),        
          ),
        ],
      ),
    );
  }
}

