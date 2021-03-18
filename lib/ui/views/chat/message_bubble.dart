import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String _message;
  final String _userId;
  final bool _isMe;
  final Key _key;

  MessageBubble(this._message, this._userId, this._isMe, this._key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: _key,
      mainAxisAlignment: _isMe?MainAxisAlignment.end: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: _isMe ? Colors.grey[300] : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: !_isMe? Radius.circular(0): Radius.circular(12),
              bottomRight: _isMe? Radius.circular(0): Radius.circular(12)
            )
          ),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            children: [
              FutureBuilder(
                future: FirebaseFirestore.instance.collection('users').doc(_userId).get(),
                builder: (ctx, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting)
                    return Text("Loading...");

                  return Text(snapshot.data['username'], style: TextStyle(
                    color: _isMe ? Theme.of(context).primaryColor :Colors.white
                  ),);
                },
              ),
              Text(_message,
                style: TextStyle(
                  color: _isMe ? Theme.of(context).primaryColor :Colors.white
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
