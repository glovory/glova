import 'package:flutter/material.dart';

import '../../glova.dart';
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

  /// Widget child
  final Widget child;

  /// Icon
  final Icon icon;

  /// icon position of the button.
  final isLeading;

  /// padding of the button.
  final EdgeInsetsGeometry padding;

  /// disabled color.
  final Color disabledColor;

  /// text disabled color.
  final Color disabledTextColor;

  /// require the button fill the width. Default to false.
  final bool stretch;

  /// text style for button
  final TextStyle textStyle;
  
  /// the shape of button
  final ShapeBorder shapeBorder;

  OvaButton({
    this.size = OvaButtonSize.medium,
    this.appearance = OvaButtonAppearance.filled,
    this.status = OvaButtonStatus.primary,
    this.onPress,
    this.backgroundColor,
    this.child,
    this.icon,
    this.isLeading = true,
    this.padding,
    this.disabledColor,
    this.disabledTextColor,
    this.stretch = false,
    this.textStyle,
    this.shapeBorder,
  })  : assert(size != null),
        assert(appearance != null),
        assert(status != null),
        assert(child != null || icon != null);

  bool get enabled => onPress != null;

  @override
  _OvaButtonState createState() => _OvaButtonState();
}

class _OvaButtonState extends State<OvaButton> {
  Widget ovaButton({OvaButtonThemeData buttonTheme, OvaTextTheme textTheme}) {
    switch (widget.appearance) {
      case OvaButtonAppearance.filled:
        return RaisedButton(
          onPressed: () {},
          child: childOvaButton(buttonTheme: buttonTheme, textTheme: textTheme),
          color: buttonTheme.getColor(widget),
          textColor: buttonTheme.getTextColor(widget),
          elevation: 0,
          disabledElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
        );
        break;
      case OvaButtonAppearance.outline:
        return OutlineButton(
          onPressed: () {},
          child: childOvaButton(buttonTheme: buttonTheme, textTheme: textTheme),
          borderSide: BorderSide(
            color: buttonTheme.getColor(widget),
          ),
          textColor: buttonTheme.getTextColor(widget),
          highlightedBorderColor: buttonTheme.getTextColor(widget),
        );
        break;
      case OvaButtonAppearance.ghost:
        return FlatButton(
          onPressed: () {},
          child: childOvaButton(buttonTheme: buttonTheme, textTheme: textTheme),
          textColor: buttonTheme.getTextColor(widget),
        );
        break;
      default:
        return RaisedButton(
          onPressed: () {},
          child: childOvaButton(buttonTheme: buttonTheme, textTheme: textTheme),
          color: buttonTheme.getColor(widget),
          elevation: 0,
          disabledElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
        );
        break;
    }
  }

  Widget childOvaButton({OvaButtonThemeData buttonTheme, OvaTextTheme textTheme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: (widget.stretch) ? MainAxisSize.max : MainAxisSize.min,
      children: <Widget>[
        if (widget.icon != null && widget.isLeading) ...[
          Icon(
            widget.icon.icon,
            size: widget.icon.size ?? buttonTheme.getSizeIcon(widget),
          ),
        ],
        if (widget.child != null) ...[
          if (widget.icon != null && widget.isLeading) ...[
            SizedBox(width: 8),
          ],
          (widget.child is Text)
              ? Text(
                  (widget.child as Text).data,
                  style: buttonTheme.getTextStyle(widget, textTheme),
                )
              : widget.child,
          if (widget.icon != null && !widget.isLeading) ...[
            SizedBox(width: 8),
          ],
        ],
        if (widget.icon != null && !widget.isLeading) ...[
          Icon(
            widget.icon.icon,
            size: widget.icon.size ?? buttonTheme.getSizeIcon(widget),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    OvaTextTheme textTheme = OvaTheme.of(context).textTheme;
    OvaButtonThemeData buttonTheme = OvaButtonTheme.of(context);

    return ButtonTheme(
      minWidth: 0,
      height: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      buttonColor: buttonTheme.getColor(widget),
      padding: buttonTheme.getPadding(widget),
      hoverColor: buttonTheme.getHoverColor(widget),
      focusColor: buttonTheme.getFocusColor(widget),
      highlightColor: buttonTheme.getActiveColor(widget),
      splashColor: buttonTheme.getActiveColor(widget),
      shape: buttonTheme.getShapeBorder(widget),
      child: ovaButton(buttonTheme: buttonTheme, textTheme: textTheme),
    );
  }
}
