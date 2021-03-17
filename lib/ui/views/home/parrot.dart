import 'package:flutter/material.dart';
import 'package:parrot/ui/views/chat/chat_screen.dart';

class ParrotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Parrot",
      home: ChatScreen(),
    );
  }
}
