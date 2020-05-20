import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';

class TuxAvatar extends StatelessWidget {
  /// size of avatar
  final double size;

  /// Controls the type of the avatar. It can be either circle, square, or rounded.
  final TuxImageAvatar tuxImageAvatar;

  /// Scale size of avatar
  final TuxWidgetSize tuxWidgetSize;

  /// Image to display avatar.
  final ImageProvider image;

  /// Radius to use rounded image. default is 4.
  final double radius;

  final BoxFit fit;

  const TuxAvatar({
    this.size = 40,
    this.tuxImageAvatar = TuxImageAvatar.circle,
    @required this.image,
    this.radius = 4,
    this.fit= BoxFit.cover,
    this.tuxWidgetSize = TuxWidgetSize.medium,
  });

  const TuxAvatar.circle({
    this.size = 40,
    @required this.image,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    this.fit= BoxFit.cover,
  })  : this.tuxImageAvatar = TuxImageAvatar.circle,
        this.radius = 0;

  const TuxAvatar.square({
    this.size = 40,
    @required this.image,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    this.fit= BoxFit.cover,
  })  : this.tuxImageAvatar = TuxImageAvatar.square,
        this.radius = 0;

  const TuxAvatar.rounded({
    this.size = 40,
    @required this.image,
    this.radius = 4,
    this.fit= BoxFit.cover,
    this.tuxWidgetSize = TuxWidgetSize.medium,
  }) : this.tuxImageAvatar = TuxImageAvatar.rounded;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: size * WidgetSizeUtils.getScale(size: tuxWidgetSize),
        width: size * WidgetSizeUtils.getScale(size: tuxWidgetSize),
        decoration: BoxDecoration(
          shape: (tuxImageAvatar == TuxImageAvatar.circle) ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: (tuxImageAvatar == TuxImageAvatar.circle)
              ? null
              : (tuxImageAvatar == TuxImageAvatar.rounded)
                  ? BorderRadius.circular(radius)
                  : BorderRadius.circular(0),
          image: DecorationImage(
            image: image,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
