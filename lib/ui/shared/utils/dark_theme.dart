import 'package:flutter/material.dart';
import 'text_theme.dart';

ThemeData darkTheme() {
  const brightness = Brightness.dark;
  const primaryColor = const Color(0xFFFFCC00);
  const lightColor = const Color(0xFFFFFFFF);
  const backgroundColor = const Color(0xFFF5F5F5);

  return ThemeData(
    brightness: brightness,

    textTheme: TextTheme(
      headline4: AppTextTheme.display1,
      headline5: AppTextTheme.headline,
      headline6: AppTextTheme.title,
      subtitle2: AppTextTheme.subtitle,
      bodyText2: AppTextTheme.body2,
      bodyText1: AppTextTheme.body1,
      caption: AppTextTheme.caption,
    ),

    buttonTheme: new ButtonThemeData(
      buttonColor: Colors.yellow,
      textTheme: ButtonTextTheme.primary,
      minWidth: 200,
    ),

    cardTheme: CardTheme(
      elevation: 5,
      color: Colors.grey,
    ),

    primaryColor: primaryColor,
    accentColor: primaryColor,
    fontFamily: 'Montserrat',
    buttonColor: Color(0xFF00C569),
    cardColor: Colors.white,
  );
}