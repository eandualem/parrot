import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WriteMessage extends StatefulWidget {
  @override
  _WriteMessageState createState() => _WriteMessageState();
  final query  = FirebaseFirestore.instance.collection("chat");
  final user = FirebaseAuth.instance.currentUser;
}

class _WriteMessageState extends State<WriteMessage> {
  var _enteredMessage = "";
  var _controller = TextEditingController();

  void _sendMessage() {
    FocusScope.of(context).unfocus();
    widget.query.add({
      "text": _enteredMessage,
      "createdAt": Timestamp.now(),
      "userId": widget.user.uid
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (value) => setState(()=> _enteredMessage = value),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage)
        ],
      ),
    );
  }
}
