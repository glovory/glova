import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';

class TuxImage extends StatelessWidget {
  /// height of image. default is 40
  final double height;

  /// width of image. default is 40
  final double width;

  /// scale size of image
  final TuxWidgetSize tuxWidgetSize;

  /// Controls the shape of image. default is square(rectangle)
  final TuxShape tuxShape;

  /// Image to display.
  final ImageProvider image;

  /// Radius to use rounded image. default is 4
  final double radius;

  final BoxFit fit;

  const TuxImage({
    this.height = 40,
    this.width = 40,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    this.tuxShape = TuxShape.square,
    @required this.image,
    this.radius = 4,
    this.fit = BoxFit.cover,
  });

  const TuxImage.circle({
    this.height = 40,
    this.width = 40,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    @required this.image,
    this.fit = BoxFit.cover,
  })  : this.tuxShape = TuxShape.circle,
        this.radius = 4;

  const TuxImage.square({
    this.height = 40,
    this.width = 40,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    @required this.image,
    this.fit = BoxFit.cover,
  })  : this.tuxShape = TuxShape.square,
        this.radius = 4;

  const TuxImage.rounded({
    this.height = 40,
    this.width = 40,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    @required this.image,
    this.fit = BoxFit.cover,
    this.radius = 4,
  }) : this.tuxShape = TuxShape.rounded;

  const TuxImage.roundedTop({
    this.height = 40,
    this.width = 40,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    @required this.image,
    this.fit = BoxFit.cover,
    this.radius = 4,
  }) : this.tuxShape = TuxShape.roundedTop;

  const TuxImage.roundedBottom({
    this.height = 40,
    this.width = 40,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    @required this.image,
    this.fit = BoxFit.cover,
    this.radius = 4,
  }) : this.tuxShape = TuxShape.roundedBottom;

  const TuxImage.roundedLeft({
    this.height = 40,
    this.width = 40,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    @required this.image,
    this.fit = BoxFit.cover,
    this.radius = 4,
  }) : this.tuxShape = TuxShape.roundedLeft;

  const TuxImage.roundedRight({
    this.height = 40,
    this.width = 40,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    @required this.image,
    this.fit = BoxFit.cover,
    this.radius = 4,
  }) : this.tuxShape = TuxShape.roundedRight;

  /// Display image by shape
  BorderRadius border({TuxShape shape}) {
    switch (shape) {
      case TuxShape.circle:
        return null;
      case TuxShape.square:
        return BorderRadius.circular(0);
      case TuxShape.rounded:
        return BorderRadius.circular(radius);
      case TuxShape.roundedTop:
        return BorderRadius.vertical(top: Radius.circular(radius));
      case TuxShape.roundedBottom:
        return BorderRadius.vertical(bottom: Radius.circular(radius));
      case TuxShape.roundedLeft:
        return BorderRadius.horizontal(left: Radius.circular(radius));
      case TuxShape.roundedRight:
        return BorderRadius.horizontal(right: Radius.circular(radius));
      default:
        return BorderRadius.circular(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: height * WidgetSizeUtils.getScale(size: tuxWidgetSize),
        width: width * WidgetSizeUtils.getScale(size: tuxWidgetSize),
        decoration: BoxDecoration(
          shape: (tuxShape == TuxShape.circle) ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: border(shape: tuxShape),
          image: DecorationImage(
            image: image,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
