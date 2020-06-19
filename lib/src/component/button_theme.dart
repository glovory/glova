import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:glova/glova.dart';

import "button.dart";

const Map<OvaButtonSize, EdgeInsetsGeometry> _textOnlyPadding = {
  OvaButtonSize.tiny: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  OvaButtonSize.small: EdgeInsets.symmetric(vertical: 8, horizontal: 16.5),
  OvaButtonSize.medium: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  OvaButtonSize.large: EdgeInsets.symmetric(vertical: 14, horizontal: 20.5),
  OvaButtonSize.giant: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
};

/// Theme data for OvaButton
@immutable
class OvaButtonThemeData with Diagnosticable {
  /// Map of each padding based on ova button size
  final Map<OvaButtonSize, EdgeInsetsGeometry> padding;

  final Map<OvaButtonStatus, Color> statusColor;

  factory OvaButtonThemeData({
    Map<OvaButtonSize, EdgeInsetsGeometry> padding,
    OvaColorSwatch colorSwatch,
  }) {
    // TODO default padding


    return OvaButtonThemeData.raw(
      padding: padding,
    );
  }

  OvaButtonThemeData.raw({
    this.padding,
    this.statusColor,
  });

  Color getColor(OvaButton button) {
    if (button.backgroundColor != null) {
      return button.backgroundColor;
    }

    return statusColor[button.status];
  }
}

class OvaButtonTheme extends InheritedTheme {
  final OvaButtonThemeData data;

  OvaButtonTheme({
    @required this.data,
  });

  @override
  bool updateShouldNotify(OvaButtonTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return child;
  }
}
