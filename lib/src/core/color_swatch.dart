import 'package:eva_color/eva_color.dart';
import 'package:flutter/foundation.dart';

@immutable
class OvaColorSwatch with Diagnosticable {
  /// Primary color from Eva color generator
  final EvaColor primaryColor;

  /// Primary transparent color
  final EvaTransparentColor primaryTransparentColor;

  /// Basic color from white to black
  final EvaBasicColor basicColor;

  /// Basic light color
  final EvaTransparentColor basicLightTransparentColor;

  /// Basic dark color
  final EvaTransparentColor basicDarkTransparentColor;

  /// Success color from Eva color generator
  final EvaColor successColor;

  /// Success transparent color
  final EvaTransparentColor successTransparentColor;

  /// Info color from Eva color generator
  final EvaColor infoColor;

  /// Success transparent color
  final EvaTransparentColor infoTransparentColor;

  /// Warning color from Eva color generator
  final EvaColor warningColor;

  /// Success transparent color
  final EvaTransparentColor warningTransparentColor;

  /// Danger color from Eva color generator
  final EvaColor dangerColor;

  /// Success transparent color
  final EvaTransparentColor dangerTransparentColor;

  /// Factory constructor that has fallback for the undefined parameters.
  factory OvaColorSwatch({
    EvaColor primaryColor,
    EvaTransparentColor primaryTransparentColor,
    EvaBasicColor basicColor,
    EvaTransparentColor basicLightTransparentColor,
    EvaTransparentColor basicDarkTransparentColor,
    EvaColor successColor,
    EvaTransparentColor successTransparentColor,
    EvaColor infoColor,
    EvaTransparentColor infoTransparentColor,
    EvaColor warningColor,
    EvaTransparentColor warningTransparentColor,
    EvaColor dangerColor,
    EvaTransparentColor dangerTransparentColor,
  }) {
    // TODO setup default for primary, success, info, warning, and danger
    return OvaColorSwatch.raw(
      primaryColor: primaryColor,
      primaryTransparentColor: primaryTransparentColor,
      basicColor: basicColor,
      basicLightTransparentColor: basicLightTransparentColor,
      basicDarkTransparentColor: basicDarkTransparentColor,
      successColor: successColor,
      successTransparentColor: successTransparentColor,
      infoColor: infoColor,
      infoTransparentColor: infoTransparentColor,
      warningColor: warningColor,
      warningTransparentColor: warningTransparentColor,
      dangerColor: dangerColor,
      dangerTransparentColor: dangerTransparentColor,
    );
  }

  OvaColorSwatch.raw({
    @required this.primaryColor,
    @required this.primaryTransparentColor,
    @required this.basicColor,
    @required this.basicLightTransparentColor,
    @required this.basicDarkTransparentColor,
    @required this.successColor,
    @required this.successTransparentColor,
    @required this.infoColor,
    @required this.infoTransparentColor,
    @required this.warningColor,
    @required this.warningTransparentColor,
    @required this.dangerColor,
    @required this.dangerTransparentColor,
  })  : assert(primaryColor != null),
        assert(primaryTransparentColor != null),
        assert(basicColor != null),
        assert(basicLightTransparentColor != null),
        assert(basicDarkTransparentColor != null),
        assert(successColor != null),
        assert(successTransparentColor != null),
        assert(infoColor != null),
        assert(infoTransparentColor != null),
        assert(warningColor != null),
        assert(warningTransparentColor != null),
        assert(dangerColor != null),
        assert(dangerTransparentColor != null);
}
