import 'package:flutter/foundation.dart';

import 'color_swatch.dart';

/// Theme data for OvaApp.
@immutable
class OvaThemeData with Diagnosticable {
  /// Standard color swatches for Eva Design system
  final OvaColorSwatch colorSwatch;

  /// Factory constructor that has fallback for the undefined parameters.
  factory OvaThemeData({
    OvaColorSwatch colorSwatch,
  }) {
    // TODO setup default for primary, success, info, warning, and danger
    return OvaThemeData.raw(
      colorSwatch: colorSwatch,
    );
  }

  OvaThemeData.raw({
    @required this.colorSwatch,
  }) : assert(colorSwatch != null);
}
