// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, missing_required_param

import 'package:flutter/material.dart';
import 'package:ug_app/widgets/course_form.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Course'),
        centerTitle: true,
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryTextTheme.button.color,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
            children: [
              Expanded(child: CourseForm(),),
            ]
        ),
      ),
    );
  }
}
