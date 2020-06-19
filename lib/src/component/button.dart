import 'package:flutter/material.dart';

import '../core/theme.dart';
import '../core/theme_data.dart';
import 'button_theme.dart';

/// Available status for [OvaButton] component
enum OvaButtonStatus {
  primary,
  success,
  warning,
  danger,
  info,
  control,
  basic,
}

/// Available appearance for [OvaButton] component
enum OvaButtonAppearance {
  filled,
  outline,
  ghost,
}

/// Available size for [OvaButton] component
enum OvaButtonSize {
  giant,
  large,
  medium,
  small,
  tiny,
}

/// Available state for [OvaButton] component
enum OVaButtonState {
  /// Alternative to `default` state, because it is reserved keyword in dart
  normal,
  hover,
  active,
  focus,
  disabled,
}

/// Button that implements Eva design system
class OvaButton extends StatefulWidget {
  /// Size of the button. Default to [OvaButtonSize.medium]
  final OvaButtonSize size;

  /// Appearance of the button. Default to [OvaButtonAppearance.filled]
  final OvaButtonAppearance appearance;

  /// Status of the button. Default to [OvaButtonStatus.primary]
  final OvaButtonStatus status;

  /// Function to execute one the button is on pressed. If set null, it means
  /// the button is disabled.
  final VoidCallback onPress;

  /// background color
  final Color backgroundColor;

  OvaButton({
    this.size = OvaButtonSize.medium,
    this.appearance = OvaButtonAppearance.filled,
    this.status = OvaButtonStatus.primary,
    this.onPress,
    this.backgroundColor,
  })  : assert(size != null),
        assert(appearance != null),
        assert(status != null);

  @override
  _OvaButtonState createState() => _OvaButtonState();
}

class _OvaButtonState extends State<OvaButton> {
  @override
  Widget build(BuildContext context) {
    OvaThemeData theme = OvaTheme.of(context);
    OvaButtonThemeData buttonTheme = theme.buttonTheme;

    return Container(
      color: buttonTheme.getColor(widget),
    );
  }
}
