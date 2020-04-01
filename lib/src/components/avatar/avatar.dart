import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';

class TuxAvatar extends StatelessWidget {
  /// Controls the type of the avatar. It can be either circle, square, or rounded.
  final TuxImageAvatar tuxImageAvatar;

  /// Image to display avatar.
  final Widget image;

  /// Radius to use rounded image. default is 20.
  final double radius;

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

  /// Display image by type from tuxImageAvatar
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
