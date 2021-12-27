// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
final Map<String, dynamic> adminData;
AdminScreen(this.adminData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Admin Board'),
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