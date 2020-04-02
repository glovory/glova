import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';

class TuxImage extends StatelessWidget {
  /// Controls the shape of image. default is square(rectangle)
  final TuxShape tuxShape;

  /// Image to display.
  final Widget image;

  /// Radius to use rounded image. default is 20.
  final double radius;

  const TuxImage({
    this.tuxShape = TuxShape.square,
    @required this.image,
    this.radius = 20,
  });

  const TuxImage.circle({
    @required this.image,
  })  : this.tuxShape = TuxShape.circle,
        this.radius = 20;

  const TuxImage.square({
    @required this.image,
  })  : this.tuxShape = TuxShape.square,
        this.radius = 20;

  const TuxImage.rounded({
    @required this.image,
    this.radius = 20,
  }) : this.tuxShape = TuxShape.rounded;

  const TuxImage.roundedTop({
    @required this.image,
    this.radius = 20,
  }) : this.tuxShape = TuxShape.roundedTop;

  const TuxImage.roundedBottom({
    @required this.image,
    this.radius = 20,
  }) : this.tuxShape = TuxShape.roundedBottom;

  const TuxImage.roundedLeft({
    @required this.image,
    this.radius = 20,
  }) : this.tuxShape = TuxShape.roundedLeft;

  const TuxImage.roundedRight({
    @required this.image,
    this.radius = 20,
  }) : this.tuxShape = TuxShape.roundedRight;

  /// Display image by shape
  Widget child({TuxShape shape}) {
    switch (shape) {
      case TuxShape.circle:
        return ClipOval(
          child: image,
        );
      case TuxShape.square:
        return ClipRect(
          child: image,
        );
      case TuxShape.rounded:
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: image,
        );
      case TuxShape.roundedTop:
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
          child: image,
        );
      case TuxShape.roundedBottom:
        return ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius)),
          child: image,
        );
      case TuxShape.roundedLeft:
        return ClipRRect(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(radius)),
          child: image,
        );
      case TuxShape.roundedRight:
        return ClipRRect(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(radius)),
          child: image,
        );
      default:
        return ClipRect(
          child: image,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return child(shape: tuxShape);
  }
}
