import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {

  final query  = FirebaseFirestore.instance.collection("chat").orderBy("createdAt", descending: true);
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
            child: Text(querySnapshot.docs[index]["text"]),
          ),
        );
      });
  }
}
