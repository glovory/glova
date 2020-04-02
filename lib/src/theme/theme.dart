import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';
import 'package:meta/meta.dart';

class TuxTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    primaryColor: TuxColor.primary,
    textTheme: TuxTextStyle.tuxLight(),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
    primaryColor: TuxColor.primary,
    textTheme: TuxTextStyle.tuxDark(),
  );

  static ThemeData customTheme({@required ThemeData themeData}) {
    return themeData;
  }
}

class TuxTextStyle {
  static TextTheme tuxLight() {
    return TextTheme();
  }

  static TextTheme tuxDark() {
    return TextTheme();
  }
}
