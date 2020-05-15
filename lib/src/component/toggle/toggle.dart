import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../glukutux.dart';

class TuxToggle extends StatefulWidget {
  /// Controls the status and the color of toggle.
  final TuxStatus tuxStatus;

  /// size of toggle
  final TuxWidgetSize tuxWidgetSize;

  /// position of label
  final TuxHorizontalPositioning tuxHorizontalPositioning;

  final String label;

  /// Value of toggle.
  final bool initialValue;

  /// Call this methos when user click the widget and value is changed.
  final Function(bool) onChanged;

  /// Controls of toggle is active or not
  final bool enable;

  final EdgeInsets padding;

  final double labelPadding;

  const TuxToggle({
    this.tuxStatus = TuxStatus.primary,
    @required this.initialValue,
    @required this.onChanged,
    this.enable = true,
    this.tuxWidgetSize = TuxWidgetSize.medium,
    this.tuxHorizontalPositioning = TuxHorizontalPositioning.left,
    this.label,
    this.padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    this.labelPadding = 4,
  });

  @override
  _TuxToggleState createState() => _TuxToggleState();
}

class _TuxToggleState extends State<TuxToggle> with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // init animation controller
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    // init animation
    _circleAnimation = AlignmentTween(
            begin: widget.initialValue ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.initialValue ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  /// Color of toggle
  Color colorToggle() {
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
        return Container(
          margin: widget.padding,
          child: Row(
            children: <Widget>[
              if (widget.label != null &&
                  widget.tuxHorizontalPositioning == TuxHorizontalPositioning.left) ...[
                Container(
                  margin: EdgeInsets.only(right: widget.labelPadding),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                        fontSize: WidgetSizeUtils.getFontSize(size: widget.tuxWidgetSize) + 4,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
              GestureDetector(
                onTap: () {
                  // break operation if enable is false
                  if (!widget.enable || widget.onChanged == null) {
                    return;
                  }
                  if (_animationController.isCompleted) {
                    _animationController.reverse();
                    // set value with the initial value
                    widget.onChanged(widget.initialValue);
                  } else {
                    _animationController.forward();
                    // set value with not the initial value
                    widget.onChanged(!widget.initialValue);
                  }
                },
                child: Container(
                  width: 65.0 / WidgetSizeUtils.getToggleSize(size: widget.tuxWidgetSize),
                  height: 40.0 / WidgetSizeUtils.getToggleSize(size: widget.tuxWidgetSize),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20.0 / WidgetSizeUtils.getToggleSize(size: widget.tuxWidgetSize)),
                      color: _circleAnimation.value == Alignment.centerLeft
                          ? colorToggle().withOpacity(0.3)
                          : colorToggle()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _circleAnimation.value == Alignment.centerRight
                          ? Padding(
                              padding: EdgeInsets.only(
                                  right: 25.0 /
                                      WidgetSizeUtils.getToggleSize(size: widget.tuxWidgetSize)),
                            )
                          : Container(),
                      Align(
                        alignment: _circleAnimation.value,
                        child: Container(
                          width: 30.0 / WidgetSizeUtils.getToggleSize(size: widget.tuxWidgetSize),
                          height: 30.0 / WidgetSizeUtils.getToggleSize(size: widget.tuxWidgetSize),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: (_circleAnimation.value == Alignment.centerRight)
                              ? Icon(
                                  EvaIcons.checkmark,
                                  size: 25 /
                                      WidgetSizeUtils.getToggleSize(size: widget.tuxWidgetSize),
                                  color: colorToggle(),
                                )
                              : null,
                        ),
                      ),
                      _circleAnimation.value == Alignment.centerLeft
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0 /
                                      WidgetSizeUtils.getToggleSize(size: widget.tuxWidgetSize)),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              if (widget.label != null &&
                  widget.tuxHorizontalPositioning == TuxHorizontalPositioning.right) ...[
                Container(
                  margin: EdgeInsets.only(left: widget.labelPadding),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                        fontSize: WidgetSizeUtils.getFontSize(size: widget.tuxWidgetSize) + 4,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
