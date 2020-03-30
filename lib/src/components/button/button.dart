import 'package:flutter/material.dart';
import 'package:glukutux/src/model/colors.dart';

import '../../model/params.dart';

class TuxButton extends StatelessWidget {
  final TuxAppearance tuxAppearance;
  final TuxStatus tuxStatus;
  final TuxShape tuxShape;
  final String label;
  final Icon leftIcon;
  final Icon rightIcon;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double elevation;
  final double radius;

  const TuxButton({
    @required this.onPressed,
    @required this.label,
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
    this.leftIcon,
    this.rightIcon,
    this.tuxStatus,
    this.padding,
    this.elevation = 0.0,
  })  : this.tuxAppearance = TuxAppearance.ghost,
        this.tuxShape = TuxShape.square,
        this.radius = 12;

  BorderSide borderSideButton() {
    return BorderSide(
      color: TuxColorUtils.colorByStatus(
          tuxStatus: tuxStatus, defaultColor: TuxColor.background_default),
    );
  }

  ShapeBorder shapeButton({TuxShape tuxShape}) {
    switch (tuxShape) {
      case TuxShape.square:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: borderSideButton(),
        );
      case TuxShape.circle:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: borderSideButton(),
        );
      case TuxShape.rounded:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: borderSideButton(),
        );
      case TuxShape.roundedTop:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
          side: borderSideButton(),
        );
      case TuxShape.roundedBottom:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius)),
          side: borderSideButton(),
        );
      case TuxShape.roundedLeft:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(radius)),
          side: borderSideButton(),
        );
      case TuxShape.roundedRight:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(radius)),
          side: borderSideButton(),
        );
      default:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: borderSideButton(),
        );
    }
  }

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

  Widget buttonFilled() {
    return RaisedButton(
      onPressed: onPressed,
      color: TuxColorUtils.colorByStatus(
        tuxStatus: tuxStatus,
        defaultColor: TuxColor.background_default,
      ),
      textColor: (tuxStatus != null) ? TuxColor.white : TuxColor.black,
      child: listChild(),
      padding: padding,
      shape: shapeButton(tuxShape: tuxShape),
      elevation: elevation,
    );
  }

  Widget buttonOutline() {
    return OutlineButton(
      onPressed: onPressed,
      borderSide: BorderSide(
        color: TuxColorUtils.colorByStatus(
          tuxStatus: tuxStatus,
          defaultColor: TuxColor.background_default,
        ),
      ),
      textColor: (tuxStatus != null)
          ? TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: TuxColor.background_default,
            )
          : TuxColor.background_default,
      child: listChild(),
      padding: padding,
      shape: shapeButton(tuxShape: tuxShape),
      highlightElevation: elevation,
    );
  }

  Widget buttonGhost() {
    return FlatButton(
      onPressed: onPressed,
      textColor: (tuxStatus != null)
          ? TuxColorUtils.colorByStatus(
              tuxStatus: tuxStatus,
              defaultColor: TuxColor.background_default,
            )
          : TuxColor.background_default,
      child: listChild(),
      padding: padding,
    );
  }

  Widget tuxButton() {
    switch (tuxAppearance) {
      case TuxAppearance.filled:
        return buttonFilled();
      case TuxAppearance.outline:
        return buttonOutline();
      case TuxAppearance.ghost:
        return buttonGhost();
      default:
        return buttonFilled();
    }
  }

  @override
  Widget build(BuildContext context) {
    return tuxButton();
  }
}
