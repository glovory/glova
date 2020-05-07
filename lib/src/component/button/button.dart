import 'package:flutter/material.dart';
import 'package:glukutux/src/model/colors.dart';

import '../../model/params.dart';

class TuxButton extends StatelessWidget {
  /// The size of the button
  final TuxWidgetSize tuxWidgetSize;

  /// The color of the button
  final Color color;

  /// The color for the button when it has input focus.
  final Color focusColor;

  /// The color when a pointer is hovering over it
  final Color hoverColor;

  /// The color when button is disable
  final Color disableColor;

  /// The color of border button
  final Color borderColor;

  /// The color of border button when disable
  final Color borderDisableColor;

  /// The size of border width
  final double borderWidth;

  /// The color of font
  final Color fontColor;

  /// Controls the appearance of button. It can be either filled, outline, or ghost.
  final TuxAppearance tuxAppearance;

  /// Controls the status and the color of button.
  final TuxStatus tuxStatus;

  /// Controls the shape of button
  final TuxShape tuxShape;

  /// Label of button
  final String label;

  /// Font size label of button
  final double sizeLabel;

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
    Key key,
    @required this.onPressed,
    @required this.label,
    this.sizeLabel = 20,
    this.heightLabel,
    this.fontWeightLabel,
    this.leftIcon,
    this.rightIcon,
    this.tuxAppearance = TuxAppearance.filled,
    this.tuxShape = TuxShape.rounded,
    this.tuxStatus,
    this.padding,
    this.radius = 10,
    this.elevation = 0.0,
    this.tuxWidgetSize,
    this.color = TuxColor.primary,
    this.focusColor = TuxColor.basic_500,
    this.hoverColor = TuxColor.basic_500,
    this.disableColor = TuxColor.disable_background,
    this.borderColor = TuxColor.primary,
    this.borderWidth = 1,
    this.fontColor = TuxColor.white,
    this.borderDisableColor = TuxColor.disable_background,
  }) : super(key: key);

  const TuxButton.filled({
    Key key,
    @required this.onPressed,
    @required this.label,
    this.sizeLabel = 20,
    this.heightLabel,
    this.fontWeightLabel,
    this.tuxShape = TuxShape.rounded,
    this.leftIcon,
    this.rightIcon,
    this.tuxStatus,
    this.padding,
    this.radius = 10,
    this.elevation = 0.0,
    this.tuxWidgetSize,
    this.color = TuxColor.primary,
    this.focusColor = TuxColor.basic_500,
    this.hoverColor = TuxColor.basic_500,
    this.disableColor = TuxColor.disable_background,
    this.borderColor = TuxColor.primary,
    this.borderWidth = 1,
    this.fontColor = TuxColor.white,
    this.borderDisableColor = TuxColor.disable_background,
  })  : this.tuxAppearance = TuxAppearance.filled,
        super(key: key);

  const TuxButton.outline({
    Key key,
    @required this.onPressed,
    @required this.label,
    this.sizeLabel = 20,
    this.heightLabel,
    this.fontWeightLabel,
    this.tuxShape = TuxShape.rounded,
    this.leftIcon,
    this.rightIcon,
    this.tuxStatus,
    this.padding,
    this.radius = 10,
    this.elevation = 0.0,
    this.tuxWidgetSize,
    this.focusColor = TuxColor.basic_500,
    this.hoverColor = TuxColor.basic_500,
    this.disableColor = TuxColor.disable_background,
    this.borderColor = TuxColor.primary,
    this.borderWidth = 1,
    this.fontColor = TuxColor.primary,
    this.borderDisableColor = TuxColor.disable_font,
  })  : this.tuxAppearance = TuxAppearance.outline,
        this.color = TuxColor.transparent,
        super(key: key);

  const TuxButton.ghost({
    Key key,
    @required this.onPressed,
    @required this.label,
    this.sizeLabel = 20,
    this.heightLabel,
    this.fontWeightLabel,
    this.leftIcon,
    this.rightIcon,
    this.tuxStatus,
    this.padding,
    this.elevation = 0.0,
    this.tuxWidgetSize,
    this.focusColor = TuxColor.basic_500,
    this.hoverColor = TuxColor.basic_500,
    this.disableColor = TuxColor.disable_background,
    this.fontColor = TuxColor.primary,
  })  : this.tuxAppearance = TuxAppearance.ghost,
        this.tuxShape = TuxShape.rounded,
        this.color = TuxColor.transparent,
        this.borderColor = TuxColor.transparent,
        this.borderDisableColor = TuxColor.transparent,
        this.borderWidth = 0,
        this.radius = 10,
        super(key: key);

  /// Color of border side by status
  BorderSide borderSideButton(BuildContext context) {
    return BorderSide(
      // change color to transparent
      color: Colors.transparent,
//      color: TuxColorUtils.colorByStatus(
//        tuxStatus: tuxStatus,
//        defaultColor: Theme.of(context).buttonColor,
//      ),
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
          IconTheme.merge(
            data: IconThemeData(
              size: tuxWidgetSize != null
                  ? getFontSize(size: tuxWidgetSize)
                  : sizeLabel,
              color: onPressed == null
                  ? (tuxAppearance == TuxAppearance.filled)
                      ? TuxColor.white
                      : TuxColor.disable_font
                  : fontColor == null ? TuxColor.white : fontColor,
            ),
            child: leftIcon,
          ),
          SizedBox(
            width: 16,
          ),
        ],
        Text(
          label,
          style: TextStyle(
            height: (heightLabel != null) ? heightLabel : null,
            fontSize: tuxWidgetSize != null
                ? getFontSize(size: tuxWidgetSize)
                : sizeLabel,
            fontWeight: (fontWeightLabel != null) ? fontWeightLabel : null,
            color: onPressed == null
                ? (tuxAppearance == TuxAppearance.filled)
                    ? TuxColor.white
                    : TuxColor.disable_font
                : fontColor == null ? TuxColor.white : fontColor,
          ),
          textAlign: TextAlign.center,
        ),
        if (rightIcon != null) ...[
          SizedBox(
            width: 16,
          ),
          IconTheme.merge(
            data: IconThemeData(
              size: tuxWidgetSize != null
                  ? getFontSize(size: tuxWidgetSize)
                  : sizeLabel,
              color: onPressed == null
                  ? TuxColor.disable_font
                  : fontColor == null ? TuxColor.white : fontColor,
            ),
            child: rightIcon,
          ),
        ]
      ],
    );
  }

  /// Display this widget if appearance is filled
  Widget buttonFilled(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      // set default color to button color from theme
      color: tuxStatus == null
          ? color
          : TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: Theme.of(context).buttonColor,
            ),
      // change text color to unselected color from theme if tuxstatus is null
      textColor: (tuxStatus != null) ? TuxColor.white : fontColor,
      child: listChild(),
      padding: tuxWidgetSize != null
          ? getPadding(size: tuxWidgetSize)
          : padding == null ? getPadding(size: TuxWidgetSize.medium) : padding,
      shape: shapeButton(context, tuxShape: tuxShape),
      elevation: elevation,
      // handle disable
      disabledColor: (tuxStatus != null)
          ? TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: Theme.of(context).buttonColor,
            ).withOpacity(0.5)
          : disableColor,
      disabledTextColor: disableColor == null ? Colors.white : disableColor,
      disabledElevation: 0,
    );
  }

  /// Display this widget if appearance is outline
  Widget buttonOutline(BuildContext context) {
    return OutlineButton(
      color: onPressed == null
          ? disableColor == null ? TuxColor.disable_background : disableColor
          : TuxColor.transparent,
      onPressed: onPressed,
      borderSide: BorderSide(
          // set default color of border color to unselectedwidget color from theme
          color: onPressed == null
              ? borderDisableColor
              : (tuxStatus != null)
                  ? TuxColorUtils.colorByStatus(
                      tuxStatus: tuxStatus,
                      defaultColor: Theme.of(context).buttonColor,
                    )
                  : borderColor,
          width: borderWidth),
      // change text color to unselected color from theme if tuxstatus is null
      textColor: (tuxStatus != null)
          ? TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: Theme.of(context).buttonColor,
            )
          : fontColor,
      child: listChild(),
      padding: tuxWidgetSize != null
          ? getPadding(size: tuxWidgetSize)
          : padding == null ? getPadding(size: TuxWidgetSize.medium) : padding,
      shape: shapeButton(context, tuxShape: tuxShape),
      highlightElevation: elevation,
      // handle disable
      disabledBorderColor: (tuxStatus != null)
          ? TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: Theme.of(context).buttonColor,
            ).withOpacity(0.5)
          : disableColor,
      disabledTextColor: (tuxStatus != null)
          ? TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: Theme.of(context).buttonColor,
            ).withOpacity(0.5)
          : Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
    );
  }

  /// Display this widget if appearance is ghost
  Widget buttonGhost(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      color: onPressed == null
          ? disableColor == null ? TuxColor.disable_background : disableColor
          : TuxColor.transparent,
      // change text color to unselected color from theme if tuxstatus is null
      textColor: (tuxStatus != null)
          ? TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: Theme.of(context).buttonColor,
            )
          : fontColor,
      child: listChild(),
      padding: tuxWidgetSize != null
          ? getPadding(size: tuxWidgetSize)
          : padding == null ? getPadding(size: TuxWidgetSize.medium) : padding,
      // handle disable
      disabledTextColor: (tuxStatus != null)
          ? TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: Theme.of(context).buttonColor,
            ).withOpacity(0.5)
          : Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
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

  double getFontSize({TuxWidgetSize size}) {
    switch (tuxWidgetSize) {
      case TuxWidgetSize.giant:
        return 24.0;
      case TuxWidgetSize.large:
        return 20.0;
      case TuxWidgetSize.medium:
        return 16.0;
      case TuxWidgetSize.small:
        return 14.0;
      case TuxWidgetSize.tiny:
        return 8.0;
      default:
        return 30.0;
    }
  }

  static EdgeInsets getPadding({TuxWidgetSize size}) {
    switch (size) {
      case TuxWidgetSize.giant:
        return EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0);
      case TuxWidgetSize.large:
        return EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0);
      case TuxWidgetSize.medium:
        return EdgeInsets.symmetric(vertical: 16.0, horizontal: 25.0);
      case TuxWidgetSize.small:
        return EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0);
      case TuxWidgetSize.tiny:
        return EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0);
      default:
        return EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return tuxButton(context);
  }
}
