import 'package:flutter/material.dart';
import 'package:parrot/ui/views/auth/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor,Theme.of(context).accentColor]
          )
        ),
        child: AuthForm()),
    );
  }
}
