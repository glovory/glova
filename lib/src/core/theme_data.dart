import 'package:flutter/foundation.dart';

import '../component/button_theme.dart';
import 'color_swatch.dart';

/// Theme data for OvaApp.
@immutable
class OvaThemeData with Diagnosticable {
  /// Standard color swatches for Eva Design system
  final OvaColorSwatch colorSwatch;

  /// Button theme data, with fallback to default
  final OvaButtonThemeData buttonTheme;

  /// Factory constructor that has fallback for the undefined parameters.
  factory OvaThemeData({
    OvaColorSwatch colorSwatch,
    OvaButtonThemeData buttonTheme,
  }) {
    colorSwatch ??= OvaColorSwatch(); // set default color swatch
    buttonTheme ??= OvaButtonThemeData.merge(
      theme: buttonTheme ??= OvaButtonThemeData.fallback(colorSwatch),
      swatch: colorSwatch,
    );

    return OvaThemeData.raw(
      colorSwatch: colorSwatch,
      buttonTheme: buttonTheme,
    );
  }

  /// Raw constructor
  OvaThemeData.raw({
    @required this.colorSwatch,
    @required this.buttonTheme,
  })  : assert(colorSwatch != null),
        assert(buttonTheme != null);
}
