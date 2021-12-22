// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ug_app/widgets/user_image_picker.dart';

class UserFeedbackForm extends StatefulWidget {
  UserFeedbackForm(this.submitFn, this.isLoading);
  final bool isLoading;
  final void Function(String course, String year, String subject, String feedback, String comment,File userImageFile, BuildContext ctx, GlobalKey<FormState>_formKey ) submitFn;

  @override
  _UserFeedbackFormState createState() => _UserFeedbackFormState();
}

class _UserFeedbackFormState extends State<UserFeedbackForm> {
  
  final List<String> courseType = ['BBA', 'IT'];
  final List<String> yearType = ['I', 'II', 'III','IV'];
  final List<String> feedbackType = ['Faculty', 'Course', 'Facility'];
  final _formKey = GlobalKey<FormState>();
  var _course = '';
  var _year = '';
  var _subject = '';
  var _feedback = '';
  var _comment = '';
  BuildContext ctx;
  File _userImageFile;
  void _pickedImage(File image){
    _userImageFile = image;
  }

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
      widget.submitFn(_course,_year,_subject,_feedback,_comment,_userImageFile, context, _formKey);
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
                  items: courseType.map((course) {
                    return DropdownMenuItem(
                      value: course,
                      child: Text(course),
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
                      _course = value;
                    });
                  },
                  onChanged: (newValue) {
                    setState(() {
                      _course = newValue;
                    });
                  },

                  value: courseType[0],
                ),
              ),
              //Year Selection
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
                  decoration: InputDecoration(labelText: 'Feedback Type'),
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
                    //audio file
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Comment',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a comment.';
                            }
                            if (value.length < 10) {
                              return 'please enter at least 10 character comment';
                            }
                            return null;
                          },
                        onSaved: (value) {
                          setState(() {
                            _comment = value;
                          });
                        },
                      ),
                    ),
                    //image
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: UserImagePicker(_pickedImage),
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
