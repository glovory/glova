import './params.dart';

class Size {
  // Control the size of button height
  static double getHeightButton({TuxWidgetSize size}) {
    switch (size) {
      case TuxWidgetSize.giant:
        return 45.0;
      case TuxWidgetSize.large:
        return 40.0;
      case TuxWidgetSize.medium:
        return 35.0;
      case TuxWidgetSize.small:
        return 30.0;
      case TuxWidgetSize.tiny:
        return 25.0;
      default:
        return 35.0;
    }
  }
  // Control the size of icon button width
  static double getWidthIconButton({TuxWidgetSize size}) {
    switch (size) {
      case TuxWidgetSize.giant:
        return 45.0;
      case TuxWidgetSize.large:
        return 40.0;
      case TuxWidgetSize.medium:
        return 35.0;
      case TuxWidgetSize.small:
        return 30.0;
      case TuxWidgetSize.tiny:
        return 25.0;
      default:
        return 35.0;
    }
  }
  // Control the size of text button width
  static double getWidthTextButton({TuxWidgetSize size}) {
    switch (size) {
      case TuxWidgetSize.giant:
        return 124.0;
      case TuxWidgetSize.large:
        return 108.0;
      case TuxWidgetSize.medium:
        return 99.0;
      case TuxWidgetSize.small:
        return 83.0;
      case TuxWidgetSize.tiny:
        return 66.0;
      default:
        return 99.0;
    }
  }
  // Control the size of text icon button width
  static double getWidthTextIconButton({TuxWidgetSize size}) {
    switch (size) {
      case TuxWidgetSize.giant:
        return 152.0;
      case TuxWidgetSize.large:
        return 140.0;
      case TuxWidgetSize.medium:
        return 117.0;
      case TuxWidgetSize.small:
        return 97.0;
      case TuxWidgetSize.tiny:
        return 32.0;
      default:
        return 117.0;
    }
  }

  // Control the size of icon size
  static double getIconSize({TuxWidgetSize size}) {
    switch (size) {
      case TuxWidgetSize.giant:
        return 30.0;
      case TuxWidgetSize.large:
        return 25.0;
      case TuxWidgetSize.medium:
        return 20.0;
      case TuxWidgetSize.small:
        return 15.0;
      case TuxWidgetSize.tiny:
        return 13.0;
      default:
        return 20;
    }
  }

  // Control the size of font size
  static double getFontSize({TuxWidgetSize size}) {
    switch (size) {
      case TuxWidgetSize.giant:
        return 30.0;
      case TuxWidgetSize.large:
        return 25.0;
      case TuxWidgetSize.medium:
        return 20.0;
      case TuxWidgetSize.small:
        return 15.0;
      case TuxWidgetSize.tiny:
        return 13.0;
      default:
        return 20;
    }
  }
}
