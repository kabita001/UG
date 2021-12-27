// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ug_app/screens/all_feedback_screen.dart';
import 'package:ug_app/screens/course_screen.dart';
import 'package:ug_app/screens/dashboard_screen.dart';
import 'package:ug_app/screens/registration_screen.dart';
import 'package:ug_app/screens/user_feedback_screen.dart';
import 'package:ug_app/screens/user_screen.dart';
import 'package:ug_app/screens/year_screen.dart';

class DrawerWidget extends StatelessWidget{
  final authSignout = FirebaseAuth.instance;
  final Map<String, dynamic> data;
  DrawerWidget(this.data);

  @override
  Widget build(BuildContext context) {
        return Drawer(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.redAccent,
                title: const Text('Hello !!!'),
                automaticallyImplyLeading: false, // never add back button
              ),
              if(data['role'] == 'SUPER')
              const Divider(), // creates height, thickness
              if(data['role'] == 'SUPER')// while login the role of user is super then redirect page to
              ListTile(
                  leading: Icon(Icons.pages_sharp), title: Text('Main page'),
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => DashboardScreen(data)));
                  }
              ),
              if(data['role'] == 'USER')
                Divider(),
              if(data['role'] == 'USER')// if user then redirect to uder papge
                ListTile(
                    leading: Icon(Icons.shop), title: Text('Main page'),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => UserScreen(data)));
                    }
                ),
              if(data['role'] == 'SUPER')
              Divider(),
              if(data['role'] == 'SUPER')// feedback viewer
              ListTile(
                  leading: Icon(Icons.feedback_rounded ), title: Text('Feedback'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AllFeedbackScreen()));
                  }
              ),
              if(data['role'] == 'USER')
                Divider(),
              if(data['role'] == 'USER')// give feedback
                ListTile(
                    leading: Icon(Icons.feedback_rounded ), title: Text('Your Feedback'),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => UserFeedbackScreen()));
                    }
                ),
              if(data['role'] == 'SUPER')
              Divider(),
              if(data['role'] == 'SUPER')
              ListTile(
                  leading: Icon(Icons.payment), title: Text('Registration'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => RegistrationScreen()));
                  }
              ),
              if(data['role'] == 'SUPER')
                Divider(),
              if(data['role'] == 'SUPER')
                ListTile(
                    leading: Icon(Icons.payment), title: Text('Add Course'),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CourseScreen()));
                    }
                ),
              if(data['role'] == 'SUPER')
                Divider(),
              if(data['role'] == 'SUPER')
                ListTile(
                    leading: Icon(Icons.payment), title: Text('Add Year'),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => YearScreen()));
                    }
                ),
              Divider(),
              ListTile(
                  leading: Icon(Icons.exit_to_app), title: Text('Logout'),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/');
                    FirebaseAuth.instance.signOut();
                  }
              ),
            ],

          ),
        );
  }

}
