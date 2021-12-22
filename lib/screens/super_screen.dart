// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SuperScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),
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
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(child: Text('Admin Page')),
            ]
        ),
      ),
    );

  }
}
*/