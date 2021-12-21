import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ug_app/screens/auth_screen.dart';
import 'package:ug_app/widgets/drawer_widget.dart';
class DashboardScreen extends StatelessWidget {
  final Map<String, dynamic> userData;
  DashboardScreen(this.userData);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ${userData['username']}'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryTextTheme.button.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
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
        child: Column(
            children: [
              Expanded(child: Text('DashBoard Area')),
            ]
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Firestore.instance
      //         .collection('chats/pEqs5FG3Iup37ZFXg8cm/messages')
      //         .add({'text': 'This was by added by clicking button'});
      //   },
      // ),
    );

  }
}
