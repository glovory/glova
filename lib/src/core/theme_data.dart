import 'package:eva_color/eva_color.dart';
import 'package:flutter/foundation.dart';

/// Theme data for Glukutux app.
@immutable
class TuxThemeData with Diagnosticable {
  /// Primary color from Eva color generator
  final EvaColor primaryColor;

  /// Success color from Eva color generator
  final EvaColor successColor;

  /// Info color from Eva color generator
  final EvaColor infoColor;

  /// Warning color from Eva color generator
  final EvaColor warningColor;

  /// Danger color from Eva color generator
  final EvaColor dangerColor;

  /// Factory constructor that has fallback for the undefined parameters.
  factory TuxThemeData({
    EvaColor primaryColor,
    EvaColor successColor,
    EvaColor infoColor,
    EvaColor warningColor,
    EvaColor dangerColor,
  }) {
    // TODO setup default for primary, success, info, warning, and danger
    return TuxThemeData.raw(
      primaryColor: primaryColor,
      successColor: successColor,
      infoColor: infoColor,
      warningColor: warningColor,
      dangerColor: dangerColor,
    );
  }

  TuxThemeData.raw({
    @required this.primaryColor,
    @required this.successColor,
    @required this.infoColor,
    @required this.warningColor,
    @required this.dangerColor,
  })  : assert(primaryColor != null),
        assert(successColor != null),
        assert(infoColor != null),
        assert(warningColor != null),
        assert(dangerColor != null);
}
