import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';
import 'package:meta/meta.dart';

class TuxTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    primaryColor: TuxColor.primary,

    /// This color use to appbar
    backgroundColor: TuxColor.basic_100,

    /// This color use to
    /// line of unselect tab
    /// text default button
    unselectedWidgetColor: TuxColor.basic_700,

    /// This color use to default button color
    buttonColor: TuxColor.basic_300,
    textTheme: TuxTextStyle.tuxLight(),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
    primaryColor: TuxColor.primary,

    /// This color use to appbar
    backgroundColor: TuxColor.basic_1000,

    /// This color use to
    /// line of unselect tab
    /// text default button
    unselectedWidgetColor: TuxColor.basic_200,

    /// This color use to default button color
    buttonColor: TuxColor.basic_1000,

    textTheme: TuxTextStyle.tuxDark(),
  );

  static ThemeData customTheme({@required ThemeData themeData}) {
    return themeData;
  }
}

class TuxTextStyle {
  static TextTheme tuxLight() {
    return TextTheme(
      /// This syle use to title of appbar
      title: TextStyle(
        color: TuxColor.basic_900,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),

      /// This style use to subtitle of appbar
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: TuxColor.basic_600,
      ),
    );
  }

  static TextTheme tuxDark() {
    return TextTheme(
      headline: TextStyle(
        color: TuxColor.basic_100,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: TuxColor.basic_600,
      ),
    );
  }
}
