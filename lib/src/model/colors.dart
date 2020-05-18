import 'package:flutter/widgets.dart';
import 'package:glukutux/glukutux.dart';
import './eva_color.dart';

class TuxColor {
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);

  static const Color primary = EvaColors.primary;
  static const Color success = EvaColors.success;
  static const Color info = EvaColors.info;
  static const Color warning = EvaColors.warning;
  static const Color danger = EvaColors.danger;
  static const Color background_default = Color(0xFFF7F9FC);
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
}

class TuxColorUtils {
  static Color colorByStatus({TuxStatus tuxStatus, Color defaultColor}) {
    switch (tuxStatus) {
      case TuxStatus.primary:
        return EvaColors.primary;
      case TuxStatus.success:
        return EvaColors.success;
      case TuxStatus.info:
        return EvaColors.info;
      case TuxStatus.warning:
        return EvaColors.warning;
      case TuxStatus.danger:
        return EvaColors.danger;
      default:
        return defaultColor;
    }
  }

  static Color focusColorByStatus({TuxStatus tuxStatus, Color defaultColor}) {
    switch (tuxStatus) {
      case TuxStatus.primary:
        return EvaColors.primary.shade600;
      case TuxStatus.success:
        return EvaColors.success.shade600;
      case TuxStatus.info:
        return EvaColors.info.shade600;
      case TuxStatus.warning:
        return EvaColors.warning.shade600;
      case TuxStatus.danger:
        return EvaColors.danger.shade600;
      default:
        return defaultColor;
    }
  }

  static Color hoverColorByStatus({TuxStatus tuxStatus, Color defaultColor}) {
    switch (tuxStatus) {
      case TuxStatus.primary:
        return EvaColors.primary.shade200;
      case TuxStatus.success:
        return EvaColors.success.shade200;
      case TuxStatus.info:
        return EvaColors.info.shade200;
      case TuxStatus.warning:
        return EvaColors.warning.shade200;
      case TuxStatus.danger:
        return EvaColors.danger.shade200;
      default:
        return defaultColor;
    }
  }

  static Color disableColorByStatus({TuxStatus tuxStatus, Color defaultColor}) {
    switch (tuxStatus) {
      case TuxStatus.primary:
        return EvaColors.primary.shade100;
      case TuxStatus.success:
        return EvaColors.success.shade100;
      case TuxStatus.info:
        return EvaColors.info.shade100;
      case TuxStatus.warning:
        return EvaColors.warning.shade100;
      case TuxStatus.danger:
        return EvaColors.danger.shade100;
      default:
        return defaultColor;
    }
  }

  static Color colorIconByAppearance({TuxAppearance appearance}) {
    switch (appearance) {
      case TuxAppearance.ghost:
        return EvaColors.primary;
      case TuxAppearance.filled:
        return TuxColor.white;
      case TuxAppearance.outline:
        return EvaColors.primary;
      default:
        return TuxColor.white;
    }
  }
}
