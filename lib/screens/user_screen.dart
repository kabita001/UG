// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ug_app/screens/calendar.dart';
import 'package:ug_app/screens/profile.dart';
import 'package:ug_app/screens/user_feedback_screen.dart';
import 'package:ug_app/widgets/drawer_widget.dart';
class UserScreen extends StatelessWidget {
  final Map<String, dynamic> userData;
  UserScreen(this.userData);


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Welcome ${userData['username']}'),
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
      drawer: DrawerWidget(userData),
      body: Container(
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 10.0, left: 20, right:8.0),
                child: Center(
                  child: Wrap(
                    spacing: 30.0,
                    runSpacing: 30.0,
                    children: [
                      // Profile
                      SizedBox(
                        width: 150.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.white,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => Profile(userData))); 
                              //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => VideoUpload();
                            },
                            splashColor: Colors.redAccent,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/graduated.png", width: 77.0),
                                    const SizedBox(height: 10.0),
                                    const Text(
                                      "Profile",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Feedback
                      //const Padding(padding: EdgeInsets.only(right: 5,),),
                      SizedBox(
                        width: 150.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.white,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => UserFeedbackScreen()));
                            },
                            splashColor: Colors.redAccent,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/feedback.png", width: 77.0),
                                    const SizedBox(height: 10.0),
                                    const Text(
                                      "Feedback",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //TimeTable
                      SizedBox(
                        width: 150.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.white,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const CalendarData())); 
                            },
                            splashColor: Colors.redAccent,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/timetable.jpg", width: 87.0),
                                    const SizedBox(height: 10.0),
                                    const Text(
                                      "TimeTable",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //const Padding(padding: EdgeInsets.only(right: 5,),),
                      //LogOut
                      SizedBox(
                        width: 150.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.white,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: InkWell(
                            splashColor: Colors.redAccent,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/logout.png", width: 64.0),
                                    const SizedBox(height: 0.0),
                                    ActionChip(
                                      label: const Text("Logout", style: TextStyle(
                                        fontSize:20,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      onPressed: () {
                                        FirebaseAuth.instance.signOut();
                                      },
                                      backgroundColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              
                            ),
                          ),          
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
