import 'package:flutter/widgets.dart';
import 'package:glukutux/src/model/tux_color.dart';
import 'package:glukutux/glukutux.dart';

class TuxColor extends ColorSwatch<int> {
  const TuxColor(int primary, Map<int, Color> swatch) : super(primary, swatch);

  Color get shade100 => this[100];

  Color get shade200 => this[200];

  Color get shade300 => this[300];

  Color get shade400 => this[400];

  Color get shade500 => this[500];

  Color get shade600 => this[600];

  Color get shade700 => this[700];

  Color get shade800 => this[800];

  Color get shade900 => this[900];
}

class TuxColorUtils {
  static Color colorByStatus ({TuxStatus tuxStatus, Color defaultColor}) {
    switch (tuxStatus) {
      case TuxStatus.primary:
        return TuxColorScheme.primary;
      case TuxStatus.success:
        return TuxColorScheme.success;
      case TuxStatus.info:
        return TuxColorScheme.info;
      case TuxStatus.warning:
        return TuxColorScheme.warning;
      case TuxStatus.danger:
        return TuxColorScheme.danger;
      default:
        return defaultColor;
    }
  }
}