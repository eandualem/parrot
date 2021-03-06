import 'package:flutter/material.dart';
import 'text_theme.dart';

ThemeData lightTheme() {
  const brightness = Brightness.light;
  const primaryColor = const Color(0xFF9A52B5);
  const accentColor = const Color(0xFF514A95);

  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
      headline4: AppTextTheme.display1,
      headline5: AppTextTheme.headline,
      headline6: AppTextTheme.title,
      subtitle2: AppTextTheme.subtitle,
      bodyText2: AppTextTheme.body2,
      bodyText1: AppTextTheme.body1,
      caption: AppTextTheme.caption,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primaryColor,
      )
    ),

    cardTheme: CardTheme(
      elevation: 5,
      color: Colors.white70,
    ),

    primaryColor: primaryColor,
    accentColor: accentColor,
    fontFamily: 'Montserrat',
    buttonColor: Color(0xFF00C569),
    cardColor: Colors.white,
  );
}