import 'dart:math';

import 'package:flutter/material.dart';

import '../../glova.dart';

/// Available status for [OvaSpinner] component
enum OvaSpinnerStatus {
  primary,
  success,
  info,
  warning,
  danger,
}

/// Available size for [OvaSpinner] component
enum OvaSpinnerSize {
  giant,
  large,
  medium,
  small,
  tiny,
}

class OvaSpinner extends StatefulWidget {
  /// Status of the spinner. Default to [OvaSpinnerStatus.primary]
  final OvaSpinnerStatus status;

  /// color of the spinner
  final Color color;

  /// Size of the spinner. Default to [OvaSpinnerSize.medium]
  final OvaSpinnerSize size;

  /// stroke width of the spinner
  final double strokeWidth;

  OvaSpinner({
    this.status = OvaSpinnerStatus.primary,
    this.color,
    this.size = OvaSpinnerSize.medium,
    this.strokeWidth,
  });

  @override
  _OvaSpinnerState createState() => _OvaSpinnerState();
}

class _OvaSpinnerState extends State<OvaSpinner> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    animation = CurvedAnimation(
      curve: Cubic(0.275, 0.725, 0.725, 0.275),
      parent: animationController,
    );
    animationController.repeat(min: 0.0, max: 1.0);
  }

  @override
  void dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }

  Map<OvaSpinnerStatus, Color> getColorByStatus({
    OvaColorSwatch swatch,
  }) {
    return <OvaSpinnerStatus, EvaColor>{
      OvaSpinnerStatus.primary: swatch.primaryColor,
      OvaSpinnerStatus.success: swatch.successColor,
      OvaSpinnerStatus.info: swatch.infoColor,
      OvaSpinnerStatus.warning: swatch.warningColor,
      OvaSpinnerStatus.danger: swatch.dangerColor,
    };
  }

  Color getColor({OvaThemeData ovaThemeData, OvaSpinner spinner}) {
    if (spinner.color != null) {
      return spinner.color;
    }
    return getColorByStatus(swatch: ovaThemeData.colorSwatch)[spinner.status];
  }

  Map<OvaSpinnerSize, double> getStrokeWidthBySize() {
    return <OvaSpinnerSize, double>{
      OvaSpinnerSize.giant: 32.0,
      OvaSpinnerSize.large: 28.0,
      OvaSpinnerSize.medium: 24.0,
      OvaSpinnerSize.small: 20.0,
      OvaSpinnerSize.tiny: 16.0,
    };
  }

  double getSize({OvaSpinner spinner}) {
    if (spinner.strokeWidth != null) {
      return spinner.strokeWidth;
    }
    return getStrokeWidthBySize()[spinner.size];
  }

  @override
  Widget build(BuildContext context) {
    OvaThemeData theme = OvaTheme.of(context);
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
                color: getColor(ovaThemeData: theme, spinner: widget),
                strokeWidth: getSize(spinner: widget) / 5,
              ),
              isComplex: false,
              willChange: false,
              child: SizedBox(width: getSize(spinner: widget), height: getSize(spinner: widget)),
            ),
          );
        },
      ),
    );
  }
}

class SpinnerPainter extends CustomPainter {
  /// color of spinner
  final Color color;

  /// stroke width of spinner
  final double strokeWidth;

  SpinnerPainter({this.color, this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(Offset.zero & size, 0.0, 1.5 * pi, false, paint);
  }

  @override
  bool shouldRepaint(SpinnerPainter oldPainter) {
    return oldPainter.color != color || oldPainter.strokeWidth != strokeWidth;
  }
}
