import 'package:flutter/material.dart';
import 'package:glukutux/src/model/colors.dart';

import '../../model/params.dart';

class TuxButton extends StatelessWidget {
  final TuxAppearance tuxAppearance;
  final TuxStatus tuxStatus;
  final String label;
  final Icon leftIcon;
  final Icon rightIcon;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final double elevation;

  const TuxButton({
    @required this.onPressed,
    @required this.label,
    this.leftIcon,
    this.rightIcon,
    this.tuxAppearance = TuxAppearance.filled,
    this.tuxStatus,
    this.padding,
    this.shape,
    this.elevation = 0.0,
  });

  const TuxButton.filled({
    @required this.onPressed,
    @required this.label,
    this.leftIcon,
    this.rightIcon,
    this.tuxStatus,
    this.padding,
    this.shape,
    this.elevation = 0.0,
  }) : this.tuxAppearance = TuxAppearance.filled;

  const TuxButton.outline({
    @required this.onPressed,
    @required this.label,
    this.leftIcon,
    this.rightIcon,
    this.tuxStatus,
    this.padding,
    this.shape,
    this.elevation = 0.0,
  }) : this.tuxAppearance = TuxAppearance.outline;

  const TuxButton.ghost({
    @required this.onPressed,
    @required this.label,
    this.leftIcon,
    this.rightIcon,
    this.tuxStatus,
    this.padding,
    this.shape,
    this.elevation = 0.0,
  }) : this.tuxAppearance = TuxAppearance.ghost;

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
      shape: shape,
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
      shape: shape,
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
      shape: shape,
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
