// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
          ListTile(
            title: Text(
              widget.username,
            ),
            subtitle: Text(widget.subject),
            // DateFormat('dd-MM-yyyy-hh:mm').format(
            //     widget.feedCreatedDate)
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(10 * 20.0 + 10, 180),
              child: ListView(
                padding: const EdgeInsets.all(8),

                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.imageUrl != null?widget.imageUrl: 'https://i.pinimg.com/236x/aa/c8/27/aac827a17c5e7749823cc09cc8dbeec7.jpg'),
                        radius: 80,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        child: Container(
                          width: 280.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Center(child: Text(widget.course, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))))),
                      Text(widget.year, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(widget.subject, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(widget.feedbackType, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(widget.comment, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
