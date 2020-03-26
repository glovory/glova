import 'package:flutter/material.dart';
import 'package:glukutux/src/model/colors.dart';

import '../../model/params.dart';

class TuxButton extends StatelessWidget {
  final TuxAppearance tuxAppearance;
  final TuxStatus tuxStatus;
  final Widget child;
  final VoidCallback onPressed;

  TuxButton({
    @required this.onPressed,
    this.tuxAppearance = TuxAppearance.filled,
    this.tuxStatus = TuxStatus.primary,
    this.child,
  });

  Widget buttonFilled() {
    return RaisedButton(
      onPressed: onPressed,
      color: tuxColor(status: tuxStatus),
      textColor: ColorConfig.white,
      child: child,
    );
  }

  Widget buttonOutline() {
    return OutlineButton(
      onPressed: onPressed,
      borderSide: BorderSide(color: tuxColor(status: tuxStatus)),
      textColor: tuxColor(status: tuxStatus),
      child: child,
    );
  }

  Widget buttonGhost() {
    return FlatButton(
      onPressed: onPressed,
      child: child,
      textColor: tuxColor(status: tuxStatus),
    );
  }

  Color tuxColor({TuxStatus status}) {
    switch (status) {
      case TuxStatus.primary:
        return ColorConfig.primary;
      case TuxStatus.success:
        return ColorConfig.success;
      case TuxStatus.info:
        return ColorConfig.info;
      case TuxStatus.warning:
        return ColorConfig.warning;
      case TuxStatus.danger:
        return ColorConfig.danger;
      default:
        return ColorConfig.primary;
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
