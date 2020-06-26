import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../glova.dart';
import '../core/color_swatch.dart';
import "button.dart";

enum ButtonPadding {
  textOnly,
  textWithLeftIcon,
  textWithRightIcon,
  iconOnly,
}

class OvaPadding {
  final double top;
  final double bottom;
  final double left;
  final double right;

  const OvaPadding.fromLTRB(this.left, this.top, this.right, this.bottom);

  const OvaPadding.all(double value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const OvaPadding.only({this.left = 0.0, this.top = 0.0, this.right = 0.0, this.bottom = 0.0});

  const OvaPadding.symmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;
}

const Map<OvaButtonSize, double> _paddingDefaultValue = {
  OvaButtonSize.tiny: 6,
  OvaButtonSize.small: 8,
  OvaButtonSize.medium: 10,
  OvaButtonSize.large: 12,
  OvaButtonSize.giant: 16,
};

const Map<OvaButtonSize, double> _sizeDefaultIcon = {
  OvaButtonSize.tiny: 12,
  OvaButtonSize.small: 16,
  OvaButtonSize.medium: 20,
  OvaButtonSize.large: 24,
  OvaButtonSize.giant: 24,
};

Map<OvaButtonSize, OvaPadding> _paddingFallback({
  Map<OvaButtonSize, OvaPadding> padding,
}) {
  return <OvaButtonSize, OvaPadding>{
    OvaButtonSize.tiny: _getPadding(padding: padding, size: OvaButtonSize.tiny),
    OvaButtonSize.small: _getPadding(padding: padding, size: OvaButtonSize.small),
    OvaButtonSize.medium: _getPadding(padding: padding, size: OvaButtonSize.medium),
    OvaButtonSize.large: _getPadding(padding: padding, size: OvaButtonSize.large),
    OvaButtonSize.giant: _getPadding(padding: padding, size: OvaButtonSize.giant),
  };
}

OvaPadding _getPadding({
  Map<OvaButtonSize, OvaPadding> padding,
  OvaButtonSize size,
  ButtonPadding buttonPadding,
}) {
  if (padding.containsKey(size)) {
    return OvaPadding.only(
      top: padding[size].top,
      bottom: padding[size].bottom,
      left: padding[size].left,
      right: padding[size].right,
    );
  }

  // default padding based on buttonPadding
  switch (buttonPadding) {
    case ButtonPadding.textOnly:
      return OvaPadding.symmetric(
          vertical: _paddingDefaultValue[size], horizontal: _paddingDefaultValue[size] * 2);
      break;
    case ButtonPadding.textWithLeftIcon:
      return OvaPadding.only(
        top: _paddingDefaultValue[size],
        bottom: _paddingDefaultValue[size],
        left: (_paddingDefaultValue[size] * 2) * 1 / 3,
        right: (_paddingDefaultValue[size] * 2) * 2 / 3,
      );
      break;
    case ButtonPadding.textWithRightIcon:
      return OvaPadding.only(
        top: _paddingDefaultValue[size],
        bottom: _paddingDefaultValue[size],
        left: (_paddingDefaultValue[size] * 2) * 2 / 3,
        right: (_paddingDefaultValue[size] * 2) * 1 / 3,
      );
      break;
    case ButtonPadding.iconOnly:
      return OvaPadding.all(_paddingDefaultValue[size]);
      break;
    default:
      return OvaPadding.symmetric(
          vertical: _paddingDefaultValue[size], horizontal: _paddingDefaultValue[size] * 2);
      break;
  }
}

EdgeInsetsGeometry convertOvaPaddingToEdgeInsetsGeometry({
  OvaPadding padding,
  ButtonPadding buttonPadding,
}) {
  switch (buttonPadding) {
    case ButtonPadding.textOnly:
      return EdgeInsets.only(
        right: padding.right,
        left: padding.left,
        bottom: padding.bottom,
        top: padding.top,
      );
      break;
    case ButtonPadding.textWithLeftIcon:
      return EdgeInsets.only(
        top: padding.top,
        bottom: padding.bottom,
        left: (padding.left * 2) * 1 / 3,
        right: (padding.right * 2) * 2 / 3,
      );
      break;
    case ButtonPadding.textWithRightIcon:
      return EdgeInsets.only(
        top: padding.top,
        bottom: padding.bottom,
        left: (padding.left * 2) * 2 / 3,
        right: (padding.right * 2) * 1 / 3,
      );
      break;
    case ButtonPadding.iconOnly:
      return EdgeInsets.all((padding.top + padding.bottom) / 2);
      break;
    default:
      return EdgeInsets.only(
        right: padding.right,
        left: padding.left,
        bottom: padding.bottom,
        top: padding.top,
      );
      break;
  }
}

Map<OvaButtonStatus, EvaColor> _statusColorFallback({
  Map<OvaButtonStatus, EvaColor> evaColor,
  OvaColorSwatch swatch,
}) {
  return <OvaButtonStatus, EvaColor>{
    OvaButtonStatus.basic:
        evaColor.containsKey(OvaButtonStatus.basic) ? evaColor[OvaButtonStatus.basic] : null,
    OvaButtonStatus.primary: evaColor.containsKey(OvaButtonStatus.primary)
        ? evaColor[OvaButtonStatus.primary]
        : swatch.primaryColor,
    OvaButtonStatus.success: evaColor.containsKey(OvaButtonStatus.success)
        ? evaColor[OvaButtonStatus.success]
        : swatch.successColor,
    OvaButtonStatus.info: evaColor.containsKey(OvaButtonStatus.info)
        ? evaColor[OvaButtonStatus.info]
        : swatch.infoColor,
    OvaButtonStatus.warning: evaColor.containsKey(OvaButtonStatus.warning)
        ? evaColor[OvaButtonStatus.warning]
        : swatch.warningColor,
    OvaButtonStatus.danger: evaColor.containsKey(OvaButtonStatus.danger)
        ? evaColor[OvaButtonStatus.danger]
        : swatch.dangerColor,
    OvaButtonStatus.control:
        evaColor.containsKey(OvaButtonStatus.control) ? evaColor[OvaButtonStatus.control] : null,
  };
}

/// Theme data for OvaButton
@immutable
class OvaButtonThemeData with Diagnosticable {
  /// Map of each padding based on ova button size
  final Map<OvaButtonSize, OvaPadding> padding;

  /// List of status color, with fallback to Eva color swatches
  final Map<OvaButtonStatus, EvaColor> statusColor;

  /// App color swatch can be obtained from [OvaTheme.of(context).colorSwatch]
  factory OvaButtonThemeData({
    Map<OvaButtonStatus, EvaColor> statusColor,
    @required OvaColorSwatch swatch,
    Map<OvaButtonSize, OvaPadding> padding,
  }) {
    assert(swatch != null);
    return OvaButtonThemeData.raw(
      statusColor: _statusColorFallback(
        evaColor: statusColor ?? {},
        swatch: swatch,
      ),
      padding: _paddingFallback(
        padding: padding ?? {},
      ),
    );
  }

  OvaButtonThemeData.raw({
    this.statusColor,
    this.padding,
  }) : assert(statusColor != null);

  factory OvaButtonThemeData.fallback(OvaColorSwatch swatch) {
    return OvaButtonThemeData.raw(
        statusColor: _statusColorFallback(
          evaColor: {},
          swatch: swatch,
        ),
        padding: _paddingFallback(
          padding: {},
        ));
  }

  factory OvaButtonThemeData.merge({
    OvaButtonThemeData theme,
    OvaColorSwatch swatch,
  }) {
    Map<OvaButtonStatus, EvaColor> definedColor = theme.statusColor;
    Map<OvaButtonSize, OvaPadding> definedPadding = theme.padding;

    return OvaButtonThemeData.raw(
        statusColor: _statusColorFallback(
          evaColor: definedColor,
          swatch: swatch,
        ),
        padding: _paddingFallback(
          padding: definedPadding,
        ));
  }

  Color getColor(OvaButton button) {
    if (!button.enabled) {
      if (button.disabledColor != null) {
        return button.disabledColor;
      }
      return OvaColor.basic.withOpacity(0.24);
    }
    if (button.backgroundColor != null) {
      return button.backgroundColor;
    }

    if (button.status == OvaButtonStatus.basic) {
      return statusColor[OvaButtonStatus.basic] ?? OvaColor.basic.shade300;
    } else if (button.status == OvaButtonStatus.control) {
      return statusColor[OvaButtonStatus.control] ?? OvaColor.basic.shade100;
    } else {
      return statusColor[button.status].shade500;
    }
  }

  Color colorByStatus({OvaButton button, Color basic, Color control, Color other}) {
    if (button.status == OvaButtonStatus.basic) {
      return statusColor[OvaButtonStatus.basic] ?? basic;
    } else if (button.status == OvaButtonStatus.control) {
      return statusColor[OvaButtonStatus.control] ?? control;
    } else {
      return other;
    }
  }

  Color getHoverColor(OvaButton button) {
    if (!button.enabled) {
      if (button.disabledColor != null) {
        return button.disabledColor;
      }
      return OvaColor.basic.withOpacity(0.24);
    }

//    if (button.status == OvaButtonStatus.basic) {
//      return statusColor[OvaButtonStatus.basic] ?? OvaColor.basic.shade200;
//    } else if (button.status == OvaButtonStatus.control) {
//      return statusColor[OvaButtonStatus.basic] ?? OvaColor.basic.shade200;
//    } else {
//      return statusColor[button.status].shade400;
//    }

    switch (button.appearance) {
      case OvaButtonAppearance.filled:
        Color other;
        if (button.status == OvaButtonStatus.basic || button.status == OvaButtonStatus.control) {
          other = OvaColor.basic;
        } else {
          other = statusColor[button.status].shade400;
        }
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.shade200,
          control: OvaColor.basic.shade200,
          other: other,
        );
        break;
      case OvaButtonAppearance.outline:
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.withOpacity(0.16),
          control: OvaColor.basic.withOpacity(0.16),
          other: OvaColor.basic.withOpacity(0.16),
        );
        break;
      case OvaButtonAppearance.ghost:
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.withOpacity(0.08),
          control: OvaColor.basic.withOpacity(0.08),
          other: OvaColor.basic.withOpacity(0.08),
        );
        break;
      default:
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.withOpacity(0.08),
          control: OvaColor.basic.withOpacity(0.08),
          other: OvaColor.basic.withOpacity(0.08),
        );
        break;
    }
  }

  Color getActiveColor(OvaButton button) {
    if (!button.enabled) {
      if (button.disabledColor != null) {
        return button.disabledColor;
      }
      return OvaColor.basic.withOpacity(0.24);
    }

    switch (button.appearance) {
      case OvaButtonAppearance.filled:
        Color other;
        if (button.status == OvaButtonStatus.basic || button.status == OvaButtonStatus.control) {
          other = OvaColor.basic;
        } else {
          other = statusColor[button.status].shade600;
        }
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.shade400,
          control: OvaColor.basic.shade300,
          other: other,
        );
        break;
      case OvaButtonAppearance.outline:
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.withOpacity(0.24),
          control: OvaColor.basic.withOpacity(0.24),
          other: OvaColor.basic.withOpacity(0.24),
        );
        break;
      case OvaButtonAppearance.ghost:
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.withOpacity(0.16),
          control: OvaColor.basic.withOpacity(0.16),
          other: OvaColor.basic.withOpacity(0.16),
        );
        break;
      default:
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.withOpacity(0.16),
          control: OvaColor.basic.withOpacity(0.16),
          other: OvaColor.basic.withOpacity(0.16),
        );
        break;
    }
  }

  Color getFocusColor(OvaButton button) {
    if (!button.enabled) {
      if (button.disabledColor != null) {
        return button.disabledColor;
      }
      return OvaColor.basic.withOpacity(0.24);
    }

    switch (button.appearance) {
      case OvaButtonAppearance.filled:
        Color other;
        if (button.status == OvaButtonStatus.basic || button.status == OvaButtonStatus.control) {
          other = OvaColor.basic;
        } else {
          other = statusColor[button.status].shade700;
        }
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.shade500,
          control: OvaColor.basic.shade500,
          other: other,
        );
        break;
      case OvaButtonAppearance.outline:
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.withOpacity(0.24),
          control: OvaColor.basic.withOpacity(0.24),
          other: OvaColor.basic.withOpacity(0.24),
        );
        break;
      case OvaButtonAppearance.ghost:
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.withOpacity(0.4),
          control: OvaColor.basic.withOpacity(0.4),
          other: OvaColor.basic.withOpacity(0.4),
        );
        break;
      default:
        return colorByStatus(
          button: button,
          basic: OvaColor.basic.withOpacity(0.4),
          control: OvaColor.basic.withOpacity(0.4),
          other: OvaColor.basic.withOpacity(0.4),
        );
        break;
    }
  }

  Color getTextColor(OvaButton button) {
    if (!button.enabled) {
      if (button.disabledTextColor != null) {
        return button.disabledTextColor;
      }
      return OvaColor.basic;
    }

    if (button.appearance == OvaButtonAppearance.filled) {
      if (button.status == OvaButtonStatus.basic || button.status == OvaButtonStatus.control) {
        return OvaColor.basic.shade800;
      } else {
        return Colors.white;
      }
    } else if (button.appearance == OvaButtonAppearance.outline) {
      if (button.status == OvaButtonStatus.basic) {
        return OvaColor.basic.shade600;
      } else if (button.status == OvaButtonStatus.control) {
        return OvaColor.basic.shade100;
      } else {
        return getColor(button);
      }
    } else {
      if (button.status == OvaButtonStatus.basic) {
        return OvaColor.basic.shade600;
      } else if (button.status == OvaButtonStatus.control) {
        return OvaColor.basic.shade100;
      } else {
        return getColor(button);
      }
    }
  }

  TextStyle getTextStyle(OvaButton button, OvaTextTheme textTheme) {
    if (button.textStyle != null) {
      return button.textStyle;
    }
    return textTheme.button[button.size];
  }

  EdgeInsetsGeometry getPadding(OvaButton button) {
    if (button.padding != null) {
      return button.padding;
    }

    ButtonPadding buttonPadding;
    if (button.child != null && button.icon != null) {
      if (button.isLeading) {
        buttonPadding = ButtonPadding.textWithLeftIcon;
      } else {
        buttonPadding = ButtonPadding.textWithRightIcon;
      }
    } else if (button.icon != null) {
      buttonPadding = ButtonPadding.iconOnly;
    } else {
      buttonPadding = ButtonPadding.textOnly;
    }

    return convertOvaPaddingToEdgeInsetsGeometry(
      padding: padding[button.size],
      buttonPadding: buttonPadding,
    );
  }

  double getSizeIcon(OvaButton button) {
    return _sizeDefaultIcon[button.size];
  }
}

class OvaButtonTheme extends InheritedTheme {
  final OvaButtonThemeData data;

  OvaButtonTheme({
    Key key,
    @required this.data,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(OvaButtonTheme oldWidget) => data != oldWidget.data;

  static OvaButtonThemeData of(BuildContext context) {
    final OvaButtonTheme inheritedButtonTheme =
        context.dependOnInheritedWidgetOfExactType<OvaButtonTheme>();
    OvaButtonThemeData buttonTheme = inheritedButtonTheme?.data;
    if (buttonTheme == null) {
      final OvaThemeData theme = OvaTheme.of(context);
      buttonTheme ??= theme.buttonTheme;
    }
    return buttonTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return child;
  }
}
