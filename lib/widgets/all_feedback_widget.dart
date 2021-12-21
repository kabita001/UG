
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ug_app/widgets/feedback_item.dart';

class AllFeedbackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (ctx, futureSnapshots) {
          if (futureSnapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return  StreamBuilder(
              stream: Firestore.instance.collection('feedbacks').snapshots(),
              builder: (ctx, feedbackSnapshot) {
                if (feedbackSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final feedDocs = feedbackSnapshot.data.documents;
                return ListView.builder(
                  itemCount: feedDocs.length,
                  itemBuilder: (ctx, index) => FeedbackItem(
                    feedDocs[index]['course'],
                    feedDocs[index]['year'],
                    feedDocs[index]['subject'],
                    feedDocs[index]['feedbackType'],
                    feedDocs[index]['comment'],
                    feedDocs[index]['imageUrl'],
                    feedDocs[index]['username'], key: ValueKey(feedDocs[index].documentID),
                  ),
                );
              });
        });
  }
}
