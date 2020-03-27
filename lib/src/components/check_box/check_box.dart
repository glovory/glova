import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';

class TuxCheckBox extends StatefulWidget {
  final TuxStatus tuxStatus;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool enable;
  final String label;

  const TuxCheckBox({
    this.tuxStatus = TuxStatus.primary,
    this.value,
    this.onChanged,
    this.enable = true,
    this.label,
  });

  @override
  _TuxCheckBoxState createState() => _TuxCheckBoxState();
}

class _TuxCheckBoxState extends State<TuxCheckBox>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
  }

  Color tuxColor({TuxStatus status}) {
    switch (status) {
      case TuxStatus.primary:
        return TuxColor.primary;
      case TuxStatus.success:
        return TuxColor.success;
      case TuxStatus.info:
        return TuxColor.info;
      case TuxStatus.warning:
        return TuxColor.warning;
      case TuxStatus.danger:
        return TuxColor.danger;
      default:
        return TuxColor.primary;
    }
  }

  bool valueCheckBox() {
    if (widget.value == null) {
      return true;
    } else {
      return widget.value;
    }
  }

  Icon iconCheckBox() {
    if (widget.value != null) {
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

  Color colorCheckBox() {
    if (widget.enable) {
      return tuxColor(status: widget.tuxStatus);
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (!widget.enable || widget.value == null) {
              return;
            }
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            valueCheckBox() == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
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
                    color: colorCheckBox().withOpacity(0.1),
                  ),
                  color: valueCheckBox()
                      ? colorCheckBox()
                      : colorCheckBox().withOpacity(0),
                ),
                child: (valueCheckBox())
                    ? Center(
                        child: iconCheckBox(),
                      )
                    : null,
              ),
              if (widget.label != null) ...[
                SizedBox(
                  width: 8,
                ),
                Text(widget.label),
              ],
            ],
          ),
        );
      },
    );
  }
}
