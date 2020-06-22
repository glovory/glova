import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../core/color_swatch.dart';
import "button.dart";

const Map<OvaButtonSize, EdgeInsetsGeometry> _textOnlyPadding = {
  OvaButtonSize.tiny: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  OvaButtonSize.small: EdgeInsets.symmetric(vertical: 8, horizontal: 16.5),
  OvaButtonSize.medium: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  OvaButtonSize.large: EdgeInsets.symmetric(vertical: 14, horizontal: 20.5),
  OvaButtonSize.giant: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
};

Map<OvaButtonStatus, Color> _statusColorFallback({
  Map<OvaButtonStatus, Color> color,
  OvaColorSwatch swatch,
}) {
  return <OvaButtonStatus, Color>{
    OvaButtonStatus.basic:
        color[OvaButtonStatus.basic] ?? swatch.basicColor.shade300,
    OvaButtonStatus.primary:
        color[OvaButtonStatus.primary] ?? swatch.primaryColor.shade500,
    OvaButtonStatus.info:
        color[OvaButtonStatus.info] ?? swatch.infoColor.shade500,
    OvaButtonStatus.success:
        color[OvaButtonStatus.success] ?? swatch.successColor.shade500,
    OvaButtonStatus.warning:
        color[OvaButtonStatus.warning] ?? swatch.warningColor.shade500,
    OvaButtonStatus.danger:
        color[OvaButtonStatus.danger] ?? swatch.dangerColor.shade500,
    OvaButtonStatus.control:
        color[OvaButtonStatus.control] ?? swatch.basicColor.shade100,
  };
}

/// Theme data for OvaButton
@immutable
class OvaButtonThemeData with Diagnosticable {
  /// Map of each padding based on ova button size
//  final Map<OvaButtonSize, EdgeInsetsGeometry> padding;

  /// List of status color, with fallback to color swatches
  final Map<OvaButtonStatus, Color> statusColor;

  /// App color swatch can be obtained from [OvaTheme.of(context).colorSwatch]
  factory OvaButtonThemeData({
    Map<OvaButtonStatus, Color> statusColor,
    @required OvaColorSwatch swatch,
  }) {
    assert(swatch != null);

    // TODO default padding

    return OvaButtonThemeData.raw(
      statusColor: _statusColorFallback(
        color: statusColor,
        swatch: swatch,
      ),
    );
  }

  factory OvaButtonThemeData.fallback(OvaColorSwatch swatch) {
    return OvaButtonThemeData.raw(
      statusColor: _statusColorFallback(
        color: {},
        swatch: swatch,
      ),
    );
  }

  factory OvaButtonThemeData.merge({
    OvaButtonThemeData theme,
    OvaColorSwatch swatch,
  }) {
    Map<OvaButtonStatus, Color> definedColor = theme.statusColor;

    return OvaButtonThemeData.raw(
      statusColor: _statusColorFallback(
        color: definedColor,
        swatch: swatch,
      ),
    );
  }

  OvaButtonThemeData.raw({
//    this.padding,
    this.statusColor,
  }) : assert(statusColor != null) {}

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
