
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  final Map<String, dynamic> userData;
  Profile(this.userData);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Hello ${userData['username']}'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 350,
              height: 20,
              margin: const EdgeInsets.only(left: 25.0),
              child:Text('UserName', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              width: 350,
              height: 60,
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(left: 30.0, right: 50.0, top: 20, bottom: 20 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.red,  // red as border color
                ),
              ),
              child: Text('${userData['username']}',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 350,
              height: 20,
              margin: const EdgeInsets.only(left: 25.0),
              child:Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),),
            Container(
              width: 350,
              height: 60,
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(left: 30.0, right: 50.0, top: 20, bottom: 20 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.red,  // red as border color
                ),
              ),
              child: Text('${userData['email']}',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 350,
              height: 20,
              margin: const EdgeInsets.only(left: 25.0),
              child: Text('Role', style: TextStyle(fontWeight: FontWeight.bold)),),
            Container(
              width: 350,
              height: 60,
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(left: 30.0, right: 50.0, top: 20, bottom: 20 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.red,  // red as border color
                ),
              ),
              child: Text('${userData['role']}',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 350,
              height: 20,
              margin: const EdgeInsets.only(left: 25.0),
              child:Text('Created date', style: TextStyle(fontWeight: FontWeight.bold)),),
            Container(
              width: 350,
              height: 80,
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(left: 30.0, right: 50.0, top: 20, bottom: 20 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.red,  // red as border color
                ),
              ),
              child: Text('${userData['userCreatedDate']}',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
          ],
        ),
      ),
    );

  }
}
