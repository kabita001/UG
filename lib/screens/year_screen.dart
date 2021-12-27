// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ug_app/widgets/year_form.dart';

class YearScreen extends StatefulWidget {
  @override
  _YearScreenState createState() => _YearScreenState();
}

class _YearScreenState extends State<YearScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Year'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryTextTheme.button.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Row(children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Logout'),
                  ]),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child: Column(
            children: [
              Expanded(child: YearForm(),),
            ]
        ),
      ),
    );
  }
}
