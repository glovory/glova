import 'package:flutter/material.dart';
import 'package:glukutux/tux_color.dart';
import 'package:glukutux/glukutux.dart';
import 'package:meta/meta.dart';

class TuxTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    primaryColor: TuxColorScheme.primary,

    /// This color use to
    /// appbar
    /// bottom navigation
    /// overlay of select
    backgroundColor: TuxColorScheme.primary[100],

    /// This color use to
    /// line of unselect tab
    /// text default button
    unselectedWidgetColor: TuxColorScheme.primary[200],

    /// This color use to
    /// default button color
    /// divider of card
    /// disable checkbox
    /// disable radio button
    /// default select color
    /// default text form field
    /// disable of toogle
    buttonColor: TuxColorScheme.primary[300],
    textTheme: TuxTextStyle.tuxLight(),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
    primaryColor: TuxColorScheme.primary[100],

    /// This color use to
    /// appbar
    /// bottom navigation
    /// overlay of select
    backgroundColor: TuxColorScheme.primary[900],

    /// This color use to
    /// line of unselect tab
    /// text default button
    unselectedWidgetColor: TuxColorScheme.primary[300],

    /// This color use to
    /// default button color
    /// divider of card
    /// disable checkbox
    /// disable radio button
    /// default select color
    /// default text form field
    /// disable of toogle
    buttonColor: TuxColorScheme.primary[800],

    textTheme: TuxTextStyle.tuxDark(),
  );

  static ThemeData customTheme({@required ThemeData themeData}) {
    return themeData;
  }
}

/// display4   112.0  thin     0.0      headline1
/// display3   56.0   normal   0.0      headline2
/// display2   45.0   normal   0.0      headline3
/// display1   34.0   normal   0.0      headline4
/// headline   24.0   normal   0.0      headline5
/// title      20.0   medium   0.0      headline6
/// subhead    16.0   normal   0.0      subtitle1
/// body2      14.0   medium   0.0      body1 (bodyText1)
/// body1      14.0   normal   0.0      body2 (bodyText2)
/// caption    12.0   normal   0.0      caption
/// button     14.0   medium   0.0      button
/// subtitle   14.0   medium   0.0      subtitle2
/// overline   10.0   normal   0.0      overline

class TuxTextStyle {
  static TextTheme tuxLight() {
    return TextTheme(
      /// This syle use to title of appbar
      title: TextStyle(
        color: TuxColorScheme.primary[600],
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),

      /// This style use to subtitle of appbar
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: TuxColorScheme.primary[600],
      ),

      /// this style is commonly used
      body1: TextStyle(
        color: TuxColorScheme.primary[600],
      ),

      /// red text color
      body2: TextStyle(
        color: TuxColorScheme.danger,
      ),
    );
  }

  static TextTheme tuxDark() {
    return TextTheme(
      headline: TextStyle(
        color: TuxColorScheme.primary[100],
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: TuxColorScheme.primary[300],
      ),
      body1: TextStyle(
        color: TuxColorScheme.primary[800],
      ),
      body2: TextStyle(
        color: TuxColorScheme.danger,
      ),
    );
  }
}
