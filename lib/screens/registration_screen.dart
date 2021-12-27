// ignore_for_file: deprecated_member_use, avoid_print, prefer_const_constructors, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ug_app/widgets/registration_form.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationScreenState();
  }
}

class RegistrationScreenState extends State<RegistrationScreen> {
  
  var _isLoading = false;
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(String email, String password, String username,
      String role, BuildContext context) async {
    AuthResult authResult;
    try {
      setState(() {
        _isLoading = true;
      });
      authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //firebase store as
      await Firestore.instance
          .collection('users')
          .document(authResult.user.uid)
          .setData({
        'username': username,
        'email': email,
        'role': role,
        'userCreatedDate': DateTime.now()
      });
    } on PlatformException catch (err) {
      var message = 'An error occured, please check your credentials!';
      if (err.message != null) {
        message = err.message;
      }
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Account Created successfully'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registration Page',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
          ),
        backgroundColor: Colors.redAccent,
      ),
      //backgroundColor: Theme.of(context).accentColor,
      body: RegistrationForm(_submitAuthForm, _isLoading),
    );
  }
}
