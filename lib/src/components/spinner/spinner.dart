import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glukutux/src/components/spinner/spinner_painter.dart';

import '../../../glukutux.dart';

class TuxSpinner extends StatefulWidget {
  final TuxStatus tuxStatus;
  final double size;

  TuxSpinner({
    this.tuxStatus = TuxStatus.primary,
    this.size = 30.0,
  });

  @override
  _TuxSpinnerState createState() => _TuxSpinnerState();
}

class _TuxSpinnerState extends State<TuxSpinner>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    animation = CurvedAnimation(
        curve: Cubic(0.275, 0.725, 0.725, 0.275), parent: animationController);

    animationController.repeat(min: 0.0, max: 1.0);
  }

  dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return Transform.rotate(
            angle: animation.value * pi * 2.0,
            child: CustomPaint(
              painter: SpinnerPainter(
                color: TuxColorUtils.colorByStatus(
                  tuxStatus: widget.tuxStatus,
                  defaultColor: TuxColor.primary,
                ),
                strokeWidth: widget.size / 6,
              ),
              isComplex: false,
              willChange: false,
              child: SizedBox(width: widget.size, height: widget.size),
            ),
          );
        },
      ),
    );
  }
}
