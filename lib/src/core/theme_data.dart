import 'package:flutter/foundation.dart';

import '../component/button_theme.dart';
import '../component/text_theme.dart';
import 'color_swatch.dart';

/// Theme data for OvaApp.
@immutable
class OvaThemeData with Diagnosticable {
  /// Standard color swatches for Eva Design system
  final OvaColorSwatch colorSwatch;

  /// Button theme data, with fallback to default
  final OvaButtonThemeData buttonTheme;

  /// Text theme
  final OvaTextTheme textTheme;

  /// Factory constructor that has fallback for the undefined parameters.
  factory OvaThemeData({
    OvaColorSwatch colorSwatch,
    OvaButtonThemeData buttonTheme,
    OvaTextTheme textTheme,
  }) {
    colorSwatch ??= OvaColorSwatch(); // set default color swatch
    buttonTheme = OvaButtonThemeData.merge(
      theme: buttonTheme ??= OvaButtonThemeData.fallback(colorSwatch),
      swatch: colorSwatch,
    );
    textTheme = OvaTextTheme.merge(textTheme: textTheme ??= OvaTextTheme.defaultTextTheme());

    return OvaThemeData.raw(
      colorSwatch: colorSwatch,
      buttonTheme: buttonTheme,
      textTheme: textTheme,
    );
  }

  /// Raw constructor
  OvaThemeData.raw({
    @required this.colorSwatch,
    this.buttonTheme,
    this.textTheme,
  }) : assert(colorSwatch != null);
}
