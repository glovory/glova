import './params.dart';
import 'package:flutter/material.dart';

class Shape {
  // Control shape of widget
  static BorderRadius borderRadiusButton({TuxShape tuxShape, double radius}) {
    switch (tuxShape) {
      case TuxShape.square:
        return BorderRadius.circular(0);
      case TuxShape.circle:
        return BorderRadius.circular(100);
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
}
