import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parrot/ui/shared/utils/app_theme.dart';
import 'package:parrot/ui/views/chat/messages.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {

  final query  = FirebaseFirestore.instance.collection("chats/IKB013wnNEqqV011Vljg/messages");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parrot"),
        actions: [
          DropdownButton(
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app,
                        color: Theme.of(context).primaryIconTheme.color,
                      ),
                      SizedBox(width: 8,),
                      Text('Logout')
                    ],
                  ),
                ),
                value: "logout",
              ),
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.color_lens_outlined,
                        color: Theme.of(context).primaryIconTheme.color,
                      ),
                      SizedBox(width: 8,),
                      Text('Change Theme')
                    ],
                  ),
                ),
                value: "changeTheme",
              )
            ],
            onChanged: (itemIdentifier) {
              final theme = Provider.of<ThemeChanger>(context, listen: false);
              if (itemIdentifier == "logout")
                FirebaseAuth.instance.signOut();
              else if (itemIdentifier == "changeTheme") {
                theme.setTheme(AppThemes.darkTheme);
              }

            },
            icon: Icon(
              Icons.more_vert_outlined,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages()),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          query.add({"test": "Working, Wooooooooo Wooooooooo"});
        },
      ),
    );
  }


}
