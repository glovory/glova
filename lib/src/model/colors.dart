import 'package:flutter/widgets.dart';
import 'package:glukutux/glukutux.dart';

class TuxColor {
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);

  static const Color primary = Color(0xFF0049E2);
  static const Color success = Color(0xFF6de196);
  static const Color info = Color(0xFF1294fc);
  static const Color warning = Color(0xFFf6a829);
  static const Color danger = Color(0xFFFA4938);
  static const Color background_default = Color(0xFFF7F9FC);

  static const Color basic_100 = Color(0xFFffffff);
  static const Color basic_200 = Color(0xFFf7f9fc);
  static const Color basic_300 = Color(0xFFedf1f7);
  static const Color basic_400 = Color(0xFFe4e9f2);
  static const Color basic_500 = Color(0xFFc5cee0);
  static const Color basic_600 = Color(0xFF8f9bb3);
  static const Color basic_700 = Color(0xFF2e3a59);
  static const Color basic_800 = Color(0xFF222b45);
  static const Color basic_900 = Color(0xFF1a2138);
  static const Color basic_1000 = Color(0xFF151a30);
  static const Color basic_1100 = Color(0xFF101426);

  static const Color pop_over_highlight_color = Color(0x55000000);
  static const Color pop_over_color = Color(0xff232323);

}

class TuxColorUtils {
  static Color colorByStatus ({TuxStatus tuxStatus, Color defaultColor}) {
    switch (tuxStatus) {
      case TuxStatus.primary:
        return TuxColor.primary;
      case TuxStatus.success:
        return TuxColor.success;
      case TuxStatus.info:
        return TuxColor.info;
      case TuxStatus.warning:
        return TuxColor.warning;
      case TuxStatus.danger:
        return TuxColor.danger;
      default:
        return defaultColor;
    }
  }
}