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
  static const Color error = Color(0xFFFF3D3D);
  static const Color disable_background = Color(0xFFedeff3);
  static const Color disable_font = Color(0xFFccd2dc);


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

  static const Color primary_100 = Color(0xFFD6E4FF);
  static const Color primary_200 = Color(0xFFADC8FF);
  static const Color primary_300 = Color(0xFF84A9FF);
  static const Color primary_400 = Color(0xFF6690FF);
  static const Color primary_500 = Color(0xFF3366FF);
  static const Color primary_600 = Color(0xFF254EDB);
  static const Color primary_700 = Color(0xFF1939B7);
  static const Color primary_800 = Color(0xFF102693);
  static const Color primary_900 = Color(0xFF091A7A);

  static const Color success_100 = Color(0xFFF4FCD0);
  static const Color success_200 = Color(0xFFE7FAA2);
  static const Color success_300 = Color(0xFFD2F171);
  static const Color success_400 = Color(0xFFBAE34D);
  static const Color success_500 = Color(0xFF99D119);
  static const Color success_600 = Color(0xFF7DB312);
  static const Color success_700 = Color(0xFF63960C);
  static const Color success_800 = Color(0xFF4C7907);
  static const Color success_900 = Color(0xFF3B6404);

  static const Color info_100 = Color(0xFFCDFBFF);
  static const Color info_200 = Color(0xFF9BF0FF);
  static const Color info_300 = Color(0xFF69DFFF);
  static const Color info_400 = Color(0xFF43CCFF);
  static const Color info_500 = Color(0xFF05ABFF);
  static const Color info_600 = Color(0xFF0385DB);
  static const Color info_700 = Color(0xFF0263B7);
  static const Color info_800 = Color(0xFF014693);
  static const Color info_900 = Color(0xFF00327A);

  static const Color warning_100 = Color(0xFFFFF7CD);
  static const Color warning_200 = Color(0xFFFFED9B);
  static const Color warning_300 = Color(0xFFFFE169);
  static const Color warning_400 = Color(0xFFFFD443);
  static const Color warning_500 = Color(0xFFFFC005);
  static const Color warning_600 = Color(0xFFDB9F03);
  static const Color warning_700 = Color(0xFFB78002);
  static const Color warning_800 = Color(0xFF936301);
  static const Color warning_900 = Color(0xFF7A4F00);

  static const Color danger_100 = Color(0xFFFFE8D5);
  static const Color danger_200 = Color(0xFFFFCAAC);
  static const Color danger_300 = Color(0xFFFFA682);
  static const Color danger_400 = Color(0xFFFF8463);
  static const Color danger_500 = Color(0xFFFF4B30);
  static const Color danger_600 = Color(0xFFDB2C23);
  static const Color danger_700 = Color(0xFFB7181C);
  static const Color danger_800 = Color(0xFF930F1D);
  static const Color danger_900 = Color(0xFF7A091E);
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

  static Color focusColorByStatus ({TuxStatus tuxStatus, Color defaultColor}) {
    switch (tuxStatus) {
      case TuxStatus.primary:
        return TuxColor.primary_600;
      case TuxStatus.success:
        return TuxColor.success_600;
      case TuxStatus.info:
        return TuxColor.info_600;
      case TuxStatus.warning:
        return TuxColor.warning_600;
      case TuxStatus.danger:
        return TuxColor.danger_600;
      default:
        return defaultColor;
    }
  }

  static Color hoverColorByStatus ({TuxStatus tuxStatus, Color defaultColor}) {
    switch (tuxStatus) {
      case TuxStatus.primary:
        return TuxColor.primary_200;
      case TuxStatus.success:
        return TuxColor.success_200;
      case TuxStatus.info:
        return TuxColor.info_200;
      case TuxStatus.warning:
        return TuxColor.warning_200;
      case TuxStatus.danger:
        return TuxColor.danger_200;
      default:
        return defaultColor;
    }
  }
  static Color disableColorByStatus ({TuxStatus tuxStatus, Color defaultColor}) {
    switch (tuxStatus) {
      case TuxStatus.primary:
        return TuxColor.primary_100;
      case TuxStatus.success:
        return TuxColor.success_100;
      case TuxStatus.info:
        return TuxColor.info_100;
      case TuxStatus.warning:
        return TuxColor.warning_100;
      case TuxStatus.danger:
        return TuxColor.danger_100;
      default:
        return defaultColor;
  }
  }

  static Color colorIconByAppearance ({TuxAppearance appearance}) {
    switch (appearance) {
      case TuxAppearance.ghost:
        return TuxColor.primary;
      case TuxAppearance.filled:
        return TuxColor.white;
      case TuxAppearance.outline:
        return TuxColor.primary;
      default:
        return TuxColor.white;
    }
  }
}