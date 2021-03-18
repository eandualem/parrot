import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parrot/ui/views/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  final query  = FirebaseFirestore.instance.collection("chat").orderBy("createdAt", descending: true);
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: query.snapshots(),
        builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> stream) {
        if (stream.connectionState == ConnectionState.waiting)
          return const Center(child: CircularProgressIndicator());

        if (stream.hasError)
          return Center(child: Text("Error in stream builder!"));

        QuerySnapshot querySnapshot = stream.data;
        return ListView.builder(
          reverse: true,
          itemCount: querySnapshot.size,
          itemBuilder: (ctx, index) => Container(
            padding: EdgeInsets.all(8),
            child: MessageBubble(
              querySnapshot.docs[index]["text"],
              querySnapshot.docs[index]["userId"],
              user.uid == querySnapshot.docs[index]["userId"],
              ValueKey(querySnapshot.docs[index].id)
            ),
          ),
        );
      });
  }
}
