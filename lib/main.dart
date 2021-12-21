import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ug_app/screens/admin_screen.dart';
import 'package:ug_app/screens/auth_screen.dart';
import 'package:ug_app/screens/dashboard_screen.dart';
import 'package:ug_app/screens/user_screen.dart';

void main() => runApp(MyApp());
// enum RoleOptions {
//   superAdmin = 'SUPER',
//   admin = 'ADMIN',
//   user = 'USER'
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          backgroundColor: Colors.pink,
          accentColor: Colors.deepPurple,
          accentColorBrightness: Brightness.dark,
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.pink,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            print (snapshot.data.uid);
            return StreamBuilder(
                stream: Firestore.instance
                    .collection('users')
                    .document(snapshot.data.uid)
                    .snapshots(),
                builder:
                    (BuildContext ctx, AsyncSnapshot<DocumentSnapshot> snap) {
                  // print(snap.data.data);
                  if (snap.hasData && snap.data != null) {
                    final user = snap.data.data;
                    if (user['role'] == 'SUPER') {
                      return DashboardScreen(user);
                    } else if (user['role'] == 'ADMIN') {
                      return AdminScreen(user);
                    } else {
                      return UserScreen(user);
                    }
                  }
                  return Material(child: Center(child: CircularProgressIndicator(),),);
                });
          }else {
            return AuthScreen();
          }
        }),
      // routes: {
      //    '/super': (ctx) => DashboardScreen(),
      // }
    );
  }
}

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.onAuthStateChanged,
//       builder: (ctx, snapshot) {
//         if (snapshot.hasData && snapshot.data != null ) {
//           print (snapshot.data.uid);
//           return StreamBuilder(
//               stream: Firestore.instance
//                   .collection('users')
//                   .document(snapshot.data.uid)
//                   .snapshots(),
//               builder:
//                   (BuildContext ctx, AsyncSnapshot<DocumentSnapshot> snap) {
//                 print(snap.data.data);
//                 if (snap.hasData && snap.data != null) {
//                   final user = snap.data.data;
//                   if (user['role'] == 'SUPER') {
//                     return DashboardScreen();
//                   } else if (user['role'] == 'ADMIN') {
//                     return AdminScreen();
//                   } else {
//                     return UserScreen();
//                   }
//                 }
//                 return Material(child: Center(child: CircularProgressIndicator(),),);
//               });
//         }
//         return AuthScreen();
//       },
//     );
//   }
// }
