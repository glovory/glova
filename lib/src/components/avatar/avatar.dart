import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';

class TuxAvatar extends StatelessWidget {
  final TuxImageAvatar tuxImageAvatar;
  final Widget image;
  final double radius; // use radius if tuximageavatar is rounded

  const TuxAvatar({
    this.tuxImageAvatar = TuxImageAvatar.circle,
    @required this.image,
    this.radius = 20,
  });

  const TuxAvatar.circle({
    @required this.image,
  })  : this.tuxImageAvatar = TuxImageAvatar.circle,
        this.radius = 20;

  const TuxAvatar.square({
    @required this.image,
  })  : this.tuxImageAvatar = TuxImageAvatar.square,
        this.radius = 20;

  const TuxAvatar.rounded({
    @required this.image,
    this.radius = 20,
  }) : this.tuxImageAvatar = TuxImageAvatar.rounded;

  Widget child({TuxImageAvatar avatar}) {
    switch (avatar) {
      case TuxImageAvatar.circle:
        return ClipOval(
          child: image,
        );
      case TuxImageAvatar.square:
        return ClipRect(
          child: image,
        );
      case TuxImageAvatar.rounded:
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: image,
        );
      default:
        return ClipOval(
          child: image,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return child(avatar: tuxImageAvatar);
  }
}
