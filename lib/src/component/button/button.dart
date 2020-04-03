import 'package:flutter/material.dart';
import 'package:glukutux/src/model/colors.dart';

import '../../model/params.dart';

class TuxButton extends StatelessWidget {
  /// Controls the appearance of button. It can be either filled, outline, or ghost.
  final TuxAppearance tuxAppearance;

  /// Controls the status and the color of button.
  final TuxStatus tuxStatus;

  /// Controls the shape of button
  final TuxShape tuxShape;

  /// Label of button
  final String label;

  /// Height label of button
  final double heightLabel;

  /// Font weight label of button
  final FontWeight fontWeightLabel;

  /// Icon on the left of button
  final Icon leftIcon;

  /// Icon on the right of button
  final Icon rightIcon;

  /// Call this method when the button is pressed
  final VoidCallback onPressed;

  /// Padding to use inside the button.
  final EdgeInsetsGeometry padding;

  /// Elevation to use shadow of button.
  final double elevation;

  /// Radius to use rounded of button.
  final double radius;

  const TuxButton({
    @required this.onPressed,
    @required this.label,
    this.heightLabel,
    this.fontWeightLabel,
    this.leftIcon,
    this.rightIcon,
    this.tuxAppearance = TuxAppearance.filled,
    this.tuxShape = TuxShape.square,
    this.tuxStatus,
    this.padding,
    this.radius = 12,
    this.elevation = 0.0,
  });

  const TuxButton.filled({
    @required this.onPressed,
    @required this.label,
    this.heightLabel,
    this.fontWeightLabel,
    this.tuxShape = TuxShape.square,
    this.leftIcon,
    this.rightIcon,
    this.tuxStatus,
    this.padding,
    this.radius = 12,
    this.elevation = 0.0,
  }) : this.tuxAppearance = TuxAppearance.filled;

  const TuxButton.outline({
    @required this.onPressed,
    @required this.label,
    this.heightLabel,
    this.fontWeightLabel,
    this.tuxShape = TuxShape.square,
    this.leftIcon,
    this.rightIcon,
    this.tuxStatus,
    this.padding,
    this.radius = 12,
    this.elevation = 0.0,
  }) : this.tuxAppearance = TuxAppearance.outline;

  const TuxButton.ghost({
    @required this.onPressed,
    @required this.label,
    this.heightLabel,
    this.fontWeightLabel,
    this.leftIcon,
    this.rightIcon,
    this.tuxStatus,
    this.padding,
    this.elevation = 0.0,
  })  : this.tuxAppearance = TuxAppearance.ghost,
        this.tuxShape = TuxShape.square,
        this.radius = 12;

  /// Color of border side by status
  BorderSide borderSideButton(BuildContext context) {
    return BorderSide(
      color: TuxColorUtils.colorByStatus(
        tuxStatus: tuxStatus,
        defaultColor: Theme.of(context).buttonColor,
      ),
    );
  }

  /// Shape of widget
  ShapeBorder shapeButton(BuildContext context, {TuxShape tuxShape}) {
    switch (tuxShape) {
      case TuxShape.square:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: borderSideButton(context),
        );
      case TuxShape.circle:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: borderSideButton(context),
        );
      case TuxShape.rounded:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: borderSideButton(context),
        );
      case TuxShape.roundedTop:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
          side: borderSideButton(context),
        );
      case TuxShape.roundedBottom:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius)),
          side: borderSideButton(context),
        );
      case TuxShape.roundedLeft:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(radius)),
          side: borderSideButton(context),
        );
      case TuxShape.roundedRight:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(radius)),
          side: borderSideButton(context),
        );
      default:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: borderSideButton(context),
        );
    }
  }

  /// Widget inside the button
  Widget listChild() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (leftIcon != null) ...[
          leftIcon,
          SizedBox(
            width: 16,
          ),
        ],
        Text(
          label,
          style: TextStyle(
            height: (heightLabel != null) ? heightLabel : null,
            fontWeight: (fontWeightLabel != null) ? fontWeightLabel : null,
          ),
          textAlign: TextAlign.center,
        ),
        if (rightIcon != null) ...[
          SizedBox(
            width: 16,
          ),
          rightIcon,
        ]
      ],
    );
  }

  /// Display this widget if appearance is filled
  Widget buttonFilled(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      // set default color to button color from theme
      color: TuxColorUtils.colorByStatus(
        tuxStatus: tuxStatus,
        defaultColor: Theme.of(context).buttonColor,
      ),
      // change text color to unselected color from theme if tuxstatus is null
      textColor: (tuxStatus != null)
          ? TuxColor.white
          : Theme.of(context).unselectedWidgetColor,
      child: listChild(),
      padding: padding,
      shape: shapeButton(context, tuxShape: tuxShape),
      elevation: elevation,
    );
  }

  /// Display this widget if appearance is outline
  Widget buttonOutline(BuildContext context) {
    return OutlineButton(
      onPressed: onPressed,
      borderSide: BorderSide(
        // set default color of border color to unselectedwidget color from theme
        color: TuxColorUtils.colorByStatus(
          tuxStatus: tuxStatus,
          defaultColor: Theme.of(context).unselectedWidgetColor,
        ),
      ),
      // change text color to unselected color from theme if tuxstatus is null
      textColor: (tuxStatus != null)
          ? TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: Theme.of(context).buttonColor,
            )
          : Theme.of(context).unselectedWidgetColor,
      child: listChild(),
      padding: padding,
      shape: shapeButton(context, tuxShape: tuxShape),
      highlightElevation: elevation,
    );
  }

  /// Display this widget if appearance is ghost
  Widget buttonGhost(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      // change text color to unselected color from theme if tuxstatus is null
      textColor: (tuxStatus != null)
          ? TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: Theme.of(context).buttonColor,
            )
          : Theme.of(context).unselectedWidgetColor,
      child: listChild(),
      padding: padding,
    );
  }

  /// Button by appearance
  Widget tuxButton(BuildContext context) {
    switch (tuxAppearance) {
      case TuxAppearance.filled:
        return buttonFilled(context);
      case TuxAppearance.outline:
        return buttonOutline(context);
      case TuxAppearance.ghost:
        return buttonGhost(context);
      default:
        return buttonFilled(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return tuxButton(context);
  }
}
