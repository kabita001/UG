// ignore_for_file: avoid_print, deprecated_member_use, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ug_app/screens/auth_screen.dart';
import 'package:ug_app/screens/dashboard_screen.dart';
import 'package:ug_app/screens/user_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Support and Feedback System',
      home: StreamBuilder(// 
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            print (snapshot.data.uid);
            return StreamBuilder(
                stream: Firestore.instance
                    .collection('users')
                    .document(snapshot.data.uid)
                    .snapshots(),
                builder:
                    (BuildContext ctx, AsyncSnapshot<DocumentSnapshot> snap) {
                  // 
                  if (snap.hasData && snap.data != null) {
                    final user = snap.data.data;
                    if (user['role'] == 'SUPER') {
                      return DashboardScreen(user);
                    /*} else if (user['role'] == 'ADMIN') {
                      return AdminScreen(user);*/
                    } else {
                      return UserScreen(user);
                    }
                  }
                  // ignore: prefer_const_constructors
                  return Material(child: Center(child: CircularProgressIndicator(),),);
                });
          }else {
            return AuthScreen();
          }
        }),
    );
  }
}
