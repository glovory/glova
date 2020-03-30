import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../glukutux.dart';

class TuxToogle extends StatefulWidget {
  final TuxStatus tuxStatus;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool enable;

  const TuxToogle({
    this.tuxStatus = TuxStatus.primary,
    this.value,
    this.onChanged,
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
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    Color colorToogle;
    if (widget.enable) {
      colorToogle = TuxColorUtils.colorByStatus(
        tuxStatus: widget.tuxStatus,
        defaultColor: TuxColor.primary,
      );
    } else {
      colorToogle = Colors.grey;
    }
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (!widget.enable) {
              return;
            }
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
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
                    ? colorToogle.withOpacity(0.3)
                    : colorToogle),
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
                            color: colorToogle,
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
