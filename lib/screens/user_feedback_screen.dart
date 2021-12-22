

// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ug_app/widgets/registration_form.dart';
import 'package:ug_app/widgets/user_feedback_form.dart';

class UserFeedbackScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserFeedbackScreenState();
  }
}

class UserFeedbackScreenState extends State<UserFeedbackScreen> {
  var _isLoading = false;
  void _sendMessage(String course, String year, String subject,
      String feedbackType, String comment,File userImageFile, BuildContext context, GlobalKey<FormState> formKey) async{

    FocusScope.of(context).unfocus();
    try {
      setState(() {
        _isLoading = true;
      });
      final user = await FirebaseAuth.instance.currentUser();
      //get user id
      final userData = await Firestore.instance.collection('users').document(user.uid).get();
      //stored in firebase storege as feedback images
      final ref = FirebaseStorage.instance.ref().child('feedback_images').child(user.uid + '.jpg');
      await ref.putFile(userImageFile).onComplete;
      final url = await ref.getDownloadURL();
      
      //stored data in firestore collection as feedback
      Firestore.instance.collection('feedbacks').add({
        'course': course,
        'year': year,
        'subject': subject,
        'feedbackType': feedbackType,
        'comment': comment,
        'userId': user.uid,
        'username': userData['username'],
        'feedCreatedDate': DateTime.now(),
        'imageUrl': url
      });

    }on PlatformException catch (err) {
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
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Your Feedback is submitted successfully'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
    setState(() {
      _isLoading = false;
    });
    formKey.currentState.reset();
    // Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Submit Feedback'),
      ),
      body: UserFeedbackForm(_sendMessage, _isLoading),
    );
  }
}
