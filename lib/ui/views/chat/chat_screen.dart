import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {

  final query  = FirebaseFirestore.instance.collection("chats/IKB013wnNEqqV011Vljg/messages");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parrot"),
      ),
      body: StreamBuilder(
        stream: query.snapshots(),
        builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> stream) {
          if (stream.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());

          if (stream.hasError)
            return Center(child: Text(stream.error.toString()));

          QuerySnapshot querySnapshot = stream.data;
          return ListView.builder(
            itemCount: querySnapshot.size,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text(querySnapshot.docs[index]["test"]),
            ),
          );

        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          query.add({"test": "Working, Wooooooooo Wooooooooo"});
        },
      ),
    );
  }


}
