// ignore_for_file: avoid_print, prefer_const_constructors, deprecated_member_use, unused_local_variable, await_only_futures, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YearForm extends StatefulWidget {
  @override
  _YearFormState createState() => _YearFormState();
}

class _YearFormState extends State<YearForm> {
  final List<String> yearType = ['I', 'II', 'III','IV'];
  final _controller = TextEditingController();
  var _selectedYear = '';
  // var _selectedCouse = '';
  void _sendyear() async{
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection('courses').add({
      'course': _selectedYear,
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
          DropdownButtonFormField(
            key: ValueKey('year'),
            items: yearType.map((year) {
              return DropdownMenuItem(
                value: year,
                child: Text(year),
              );
            }).toList(),
            decoration: InputDecoration(labelText: 'Year'),
            validator: (value) {
              if(value == null){
                return 'Select a Year';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                _selectedYear = value;
              });
            },
            onChanged: (newValue) {
              setState(() {
                _selectedYear = newValue;
              });
            },

            value: yearType[0],
          ),

          SizedBox(height: 8,),
          RaisedButton(
            onPressed: _selectedYear.trim().isEmpty ? null: _sendyear,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
