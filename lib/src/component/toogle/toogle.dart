import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../glukutux.dart';

class TuxToogle extends StatefulWidget {
  /// Controls the status and the color of toogle.
  final TuxStatus tuxStatus;

  /// Value of toogle.
  final bool value;

  /// Call this methos when user click the widget and value is changed.
  final Function(bool) onChanged;

  /// Controls of toogle is active or not
  final bool enable;

  const TuxToogle({
    this.tuxStatus = TuxStatus.primary,
    @required this.value,
    @required this.onChanged,
    this.enable = true,
  });

  @override
  _TuxToogleState createState() => _TuxToogleState();
}

class _TuxToogleState extends State<TuxToogle>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // init animation controller
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    // init animation
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  /// Color of toogle
  Color colorToogle() {
    if (widget.enable && widget.onChanged != null) {
      return TuxColorUtils.colorByStatus(
        tuxStatus: widget.tuxStatus,
        defaultColor: TuxColor.primary,
      );
    } else {
      // change color from theme if disable
      return Theme.of(context).buttonColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            // break operation if enable is false
            if (!widget.enable || widget.onChanged == null) {
              return;
            }
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            // change the value of toogle when user is tapped
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 65.0,
            height: 40.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? colorToogle().withOpacity(0.3)
                    : colorToogle()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _circleAnimation.value == Alignment.centerRight
                    ? Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                      )
                    : Container(),
                Align(
                  alignment: _circleAnimation.value,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: (_circleAnimation.value == Alignment.centerRight)
                        ? Icon(
                            EvaIcons.checkmark,
                            size: 25,
                            color: colorToogle(),
                          )
                        : null,
                  ),
                ),
                _circleAnimation.value == Alignment.centerLeft
                    ? Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
