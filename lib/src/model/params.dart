import 'package:flutter/material.dart';

enum TuxAppearance {
  filled,
  outline,
  ghost,
}
enum TuxWidgetState {
  normal,
  hover,
  active,
  focus,
  disabled,
}
enum TuxWidgetSize {
  giant,
  large,
  medium,
  small,
  tiny,
}
enum TuxStatus {
  primary,
  success,
  info,
  warning,
  danger,
}

enum TuxImageAvatar {
  circle,
  square,
  rounded,
}

enum TuxShape {
  circle,
  square,
  rounded,
  roundedTop,
  roundedBottom,
  roundedLeft,
  roundedRight,
}

enum TuxCardStatus {
  none,
  strip,
  header,
}

enum TuxHorizontalPositioning {
  left,
  right,
  none,
}

enum TuxVerticalPositioning {
  top,
  bottom,
}

class WidgetSizeUtils {
  static double getFontSize({TuxWidgetSize size}) {
    switch (size) {
      case TuxWidgetSize.giant:
        return 18;
        break;
      case TuxWidgetSize.large:
        return 16;
        break;
      case TuxWidgetSize.medium:
        return 14;
        break;
      case TuxWidgetSize.small:
        return 12;
        break;
      case TuxWidgetSize.tiny:
        return 10;
        break;
      default:
        return 14;
        break;
    }
  }

  static EdgeInsets getPadding({TuxWidgetSize size}) {
    switch (size) {
      case TuxWidgetSize.giant:
        return EdgeInsets.symmetric(vertical: 14, horizontal: 22);
        break;
      case TuxWidgetSize.large:
        return EdgeInsets.symmetric(vertical: 12, horizontal: 18);
        break;
      case TuxWidgetSize.medium:
        return EdgeInsets.symmetric(vertical: 10, horizontal: 18);
        break;
      case TuxWidgetSize.small:
        return EdgeInsets.symmetric(vertical: 6, horizontal: 14);
        break;
      case TuxWidgetSize.tiny:
        return EdgeInsets.symmetric(vertical: 4, horizontal: 10);
        break;
      default:
        return EdgeInsets.symmetric(vertical: 10, horizontal: 18);
        break;
    }
  }

  static double getToggleSize({TuxWidgetSize size}) {
    switch (size) {
      case TuxWidgetSize.giant:
        return 0.75;
        break;
      case TuxWidgetSize.large:
        return 0.875;
        break;
      case TuxWidgetSize.medium:
        return 1;
        break;
      case TuxWidgetSize.small:
        return 1.125;
        break;
      case TuxWidgetSize.tiny:
        return 1.25;
        break;
      default:
        return 1;
        break;
    }
  }
}
