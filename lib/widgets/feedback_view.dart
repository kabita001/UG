
// ignore_for_file: prefer_if_null_operators, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class FeedbackView extends StatelessWidget {
  final String course;
  final String year;
  final String subject;
  final String feedbackType;
  final String comment;
  final String imageUrl;
  final String username;
  final Key key;

  FeedbackView(this.course, this.year, this.subject, this.feedbackType,
      this.comment, this.imageUrl, this.username,
      {this.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(feedbackType),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Container(
                width: 200,
                height: 200,
                child: Image.network(imageUrl != null? imageUrl: 'https://i.pinimg.com/236x/aa/c8/27/aac827a17c5e7749823cc09cc8dbeec7.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height:10),
              SizedBox(
                child: Container(
                            width: 280.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(child: Text(course, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                            )
                          )),//year
                        SizedBox(height: 10,),
                        SizedBox(
                          child: Container(
                            width: 280.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(child: Text(year, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                            )
                          )
                        ),
                        SizedBox(height: 10,),
                        //subject
                        SizedBox(
                          child: Container(
                            width: 280.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(child: Text(subject, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                            )
                          )
                        ),
                        SizedBox(height: 10,),
                        //feedback Type
                        SizedBox(
                          child: Container(
                            width: 280.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(child: Text(feedbackType, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                            )
                          )
                        ),
                        SizedBox(height: 10,),
                        //comment
                        SizedBox(
                          child: Container(
                            width: 280.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(child: Text(comment, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                            )
                          )
                        ),
            ],
          ),
        ),
      ),
    );
  }
}