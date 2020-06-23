import 'package:flutter/cupertino.dart';
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

Map<OvaButtonStatus, Color> _statusColorFallback({
  Map<OvaButtonStatus, Color> color,
  OvaColorSwatch swatch,
}) {
  return <OvaButtonStatus, Color>{
    OvaButtonStatus.basic: _getStatusColor(
      color: color,
      status: OvaButtonStatus.basic,
      defaultColor: swatch.basicColor.shade300,
    ),
    OvaButtonStatus.primary: _getStatusColor(
      color: color,
      status: OvaButtonStatus.primary,
      defaultColor: swatch.primaryColor.shade500,
    ),
    OvaButtonStatus.success: _getStatusColor(
      color: color,
      status: OvaButtonStatus.success,
      defaultColor: swatch.successColor.shade500,
    ),
    OvaButtonStatus.info: _getStatusColor(
      color: color,
      status: OvaButtonStatus.info,
      defaultColor: swatch.infoColor.shade500,
    ),
    OvaButtonStatus.warning: _getStatusColor(
      color: color,
      status: OvaButtonStatus.warning,
      defaultColor: swatch.warningColor.shade500,
    ),
    OvaButtonStatus.danger: _getStatusColor(
      color: color,
      status: OvaButtonStatus.danger,
      defaultColor: swatch.dangerColor.shade500,
    ),
    OvaButtonStatus.control: _getStatusColor(
      color: color,
      status: OvaButtonStatus.control,
      defaultColor: swatch.basicColor.shade100,
    ),
  };
}

Color _getStatusColor(
    {Map<OvaButtonStatus, Color> color, OvaButtonStatus status, Color defaultColor}) {
  if (color.containsKey(status)) {
    return color[status];
  }
  return defaultColor;
}

/// Theme data for OvaButton
@immutable
class OvaButtonThemeData with Diagnosticable {
  /// Map of each padding based on ova button size
  final Map<OvaButtonSize, OvaPadding> padding;

  /// List of status color, with fallback to color swatches
  final Map<OvaButtonStatus, Color> statusColor;

  /// App color swatch can be obtained from [OvaTheme.of(context).colorSwatch]
  factory OvaButtonThemeData({
    Map<OvaButtonStatus, Color> statusColor,
    @required OvaColorSwatch swatch,
    Map<OvaButtonSize, OvaPadding> padding,
  }) {
    assert(swatch != null);
    return OvaButtonThemeData.raw(
      statusColor: _statusColorFallback(
        color: statusColor ?? {},
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
          color: {},
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
    Map<OvaButtonStatus, Color> definedColor = theme.statusColor;
    Map<OvaButtonSize, OvaPadding> definedPadding = theme.padding;

    return OvaButtonThemeData.raw(
        statusColor: _statusColorFallback(
          color: definedColor,
          swatch: swatch,
        ),
        padding: _paddingFallback(
          padding: definedPadding,
        ));
  }

  Color getColor(OvaButton button) {
    if (button.backgroundColor != null) {
      return button.backgroundColor;
    }

    return statusColor[button.status];
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
