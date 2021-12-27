// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ug_app/widgets/speech_to_text.dart';
import 'package:ug_app/widgets/user_image_picker.dart';

class UserFeedbackForm extends StatefulWidget {
  UserFeedbackForm(this.submitFn, this.isLoading);
  final bool isLoading;
  final void Function(String course, String year, String subject, String feedback, String comment,File userImageFile,  BuildContext ctx, GlobalKey<FormState>_formKey ) submitFn;

  @override
  _UserFeedbackFormState createState() => _UserFeedbackFormState();
}

class _UserFeedbackFormState extends State<UserFeedbackForm> {
  
  final List<String> facultyType = ['BBA', 'IT'];
  final List<String> yearType = ['I', 'II', 'III','IV'];
  final List<String> feedbackType = ['Faculty', 'Course', 'Facility'];
  final _formKey = GlobalKey<FormState>();
  var _faculty = '';
  var _year = '';
  var _subject = '';
  var _feedback = '';
  String _speechText;
  BuildContext ctx;
  File _userImageFile;
  //image
  void _pickedImage(File image){
    _userImageFile = image;
  }
  //speech to text
  void _textFromSpeech(String text){
    _speechText = text;
  }
  //


  //submit feedback
  void _trySubmit() {
    FocusScope.of(context).unfocus();
    final isValid = _formKey.currentState.validate();
    if(_userImageFile == null){
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Upload image'), backgroundColor: Theme.of(context).errorColor,));
      return;
    }
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_faculty,_year,_subject,_feedback,_speechText,_userImageFile, context, _formKey);
      print(_speechText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            shrinkWrap: true,
            children: [
              //course type
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonFormField(
                  key: ValueKey('course'),
                  items: facultyType.map((faculty) {
                    return DropdownMenuItem(
                      value: faculty,
                      child: Text(faculty),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Course'),
                  validator: (value) {
                    if(value == null){
                      return 'Select a Course';
                    }
                      return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _faculty = value;
                    });
                  },
                  onChanged: (newValue) {
                    setState(() {
                      _faculty = newValue;
                    });
                  },

                  value: facultyType[0],
                ),
              ),
              //Year Selection Field
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonFormField(
                  key: ValueKey('Year'),
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
                      _year = value;
                    });
                  },
                  onChanged: (newValue) {
                    setState(() {
                      _year = newValue;
                    });
                  },

                  value: yearType[0],
                ),
              ),
              //subject field
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Subject';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _subject = value;
                  },
                ),
              ),
              //choose category you want to give feedback about
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonFormField(
                  key: ValueKey('feedbackType'),
                  items: feedbackType.map((feedback) {
                    return DropdownMenuItem(
                      value: feedback,
                      child: Text(feedback),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Feedback Type',
                    border: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.transparent)),
                  ),
                  validator: (value) {
                    if(value == null){
                      return 'Select feedback type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _feedback = value;
                    });
                  },
                  onChanged: (newValue) {
                    setState(() {
                      _feedback = newValue;
                          });
                        },
                        value: feedbackType[0],
                      ),
                    ),
                    //audio to text feld
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: SpeechToText(_textFromSpeech),
                    ),
                    //image field
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: UserImagePicker(_pickedImage),
                    ),
                    SizedBox(
                      height: 10,

                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if(widget.isLoading)
                            CircularProgressIndicator(),
                          if(!widget.isLoading)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            ),
                            onPressed: _trySubmit,
                        child: const Text(
                          'submit',
                        style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
