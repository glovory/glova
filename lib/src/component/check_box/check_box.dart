import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';
import 'package:meta/meta.dart';

class TuxCheckBox extends StatefulWidget {
  /// Controls the status and the color of checkbox.
  final TuxStatus tuxStatus;

  /// Value of checkbox. true is active and false is unchecked. it can be null (intermediate)
  final bool initialValue;

  /// Call this method when the user click the widget and value is changed.
  final Function(bool) onChanged;

  /// Controls of checkbox is active or not
  final bool enable;

  /// Label of checkbox. on the right of checkbox.
  final String label;

  final EdgeInsetsGeometry labelPadding;

  const TuxCheckBox({
    this.tuxStatus = TuxStatus.primary,
    @required this.initialValue,
    this.onChanged,
    this.enable = true,
    this.label,
    this.labelPadding = const EdgeInsets.only(left: 6),
  });

  @override
  _TuxCheckBoxState createState() => _TuxCheckBoxState();
}

class _TuxCheckBoxState extends State<TuxCheckBox> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool value;

  @override
  void initState() {
    super.initState();
    // Animation init for change the color of checkbox
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    value = (widget.initialValue != null) ? widget.initialValue : true;
  }

  /// Icon of checkbox by value
  Icon iconCheckBox() {
    if (widget.initialValue != null) {
      return Icon(
        EvaIcons.checkmark,
        color: TuxColor.white,
        size: 15,
      );
    } else {
      return Icon(
        EvaIcons.minus,
        color: TuxColor.white,
        size: 15,
      );
    }
  }

  /// Color of checkbox
  Color colorCheckBox() {
    if (widget.enable) {
      return TuxColorUtils.colorByStatus(
        tuxStatus: widget.tuxStatus,
        defaultColor: TuxColor.primary,
      );
    } else {
      // change color to button color from theme
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
            // Break operation if value of enable is false or value of checkbox is null
            if (!widget.enable || widget.initialValue == null) {
              return;
            }
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }

            // Change value of checkbox
            setState(() {
              value = !value;
              widget.onChanged(value);
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: colorCheckBox(),
                  ),
                  color: value ? colorCheckBox() : colorCheckBox().withOpacity(0),
                ),
                child: Center(
                  child: iconCheckBox(),
                ),
              ),
              if (widget.label != null) ...[
                SizedBox(
                  width: 8,
                ),
                Flexible(
                    child: Padding(
                  padding: widget.labelPadding,
                  child: Text(widget.label),
                )),
              ],
            ],
          ),
        );
      },
    );
  }
}
