import 'package:flutter/material.dart';
import 'package:glukutux/src/model/colors.dart';

import '../../model/params.dart';

class TuxButton extends StatelessWidget {
  final TuxAppearance tuxAppearance;
  final TuxStatus tuxStatus;
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final double elevation;

  TuxButton({
    @required this.onPressed,
    this.tuxAppearance = TuxAppearance.filled,
    this.tuxStatus,
    this.child,
    this.padding,
    this.shape,
    this.elevation = 0.0,
  });

  Widget buttonFilled() {
    return RaisedButton(
      onPressed: onPressed,
      color: tuxColor(status: tuxStatus),
      textColor: (tuxStatus != null) ? TuxColor.white : TuxColor.black,
      child: child,
      padding: padding,
      shape: shape,
      elevation: elevation,
    );
  }

  Widget buttonOutline() {
    return OutlineButton(
      onPressed: onPressed,
      borderSide: BorderSide(color: tuxColor(status: tuxStatus)),
      textColor:
          (tuxStatus != null) ? TuxColor.white : TuxColor.background_default,
      child: child,
      padding: padding,
      shape: shape,
      highlightElevation: elevation,
    );
  }

  Widget buttonGhost() {
    return FlatButton(
      onPressed: onPressed,
      textColor:
          (tuxStatus != null) ? TuxColor.white : TuxColor.background_default,
      child: child,
      padding: padding,
      shape: shape,
    );
  }

  Color tuxColor({TuxStatus status}) {
    switch (status) {
      case TuxStatus.primary:
        return TuxColor.primary;
      case TuxStatus.success:
        return TuxColor.success;
      case TuxStatus.info:
        return TuxColor.info;
      case TuxStatus.warning:
        return TuxColor.warning;
      case TuxStatus.danger:
        return TuxColor.danger;
      default:
        return TuxColor.background_default;
    }
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
