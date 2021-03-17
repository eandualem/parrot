import 'package:flutter/material.dart';
import 'package:parrot/ui/shared/utils/app_theme.dart';
import 'package:parrot/ui/shared/utils/light_theme.dart';
import 'package:parrot/ui/views/auth/auth_screen.dart';
import 'package:provider/provider.dart';

class ParrotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (ctx) => ThemeChanger(),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).themeData;
    return MaterialApp(
      title: "Parrot",
      home: AuthScreen(),
      theme: lightTheme() //theme,
    );
  }
}
