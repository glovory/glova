import 'package:flutter/material.dart';
import 'package:glukutux/src/model/tux_color.dart';
import 'package:glukutux/glukutux.dart';

class TuxRadioButton extends StatefulWidget {
  /// Controls the status and the color of radio button
  final TuxStatus tuxStatus;

  /// List of value from radio button
  final List radioValues;

  /// List of label from radio button
  final List<String> radioLables;

  /// Call this method when the value is changed
  final Function(dynamic) onChanged;

  /// Direction of radio button. direction is horizontal if the value is true, and vertical if the value false
  final bool horizontal;

  /// Controls of radio button is active or not
  final bool enabled;

  const TuxRadioButton({
    this.tuxStatus = TuxStatus.primary,
    @required this.radioLables,
    @required this.radioValues,
    @required this.onChanged,
    this.horizontal = false,
    this.enabled = true,
  });

  _TuxRadioButtonState createState() => _TuxRadioButtonState();
}

class _TuxRadioButtonState extends State<TuxRadioButton> {
  dynamic currentSelectedValue = 0;
  String currentSelectedLabel;

  @override
  void initState() {
    super.initState();
    currentSelectedLabel = widget.radioLables[0];
  }

  /// Function for change the value
  void changeValue(dynamic value, int index) {
    // Break operation if value of enable is false or onchanged is null
    if (!widget.enabled || widget.onChanged == null) {
      return;
    }
    widget.onChanged(widget.radioValues[index]);
    setState(() {
      currentSelectedValue = widget.radioValues[index];
    });
  }

  /// Color of radio
  Color colorRadio() {
    if (widget.enabled && widget.onChanged != null) {
      return TuxColorUtils.colorByStatus(
        tuxStatus: widget.tuxStatus,
        defaultColor: TuxColorScheme.primary,
      );
    } else {
      // change color to button color from theme
      return Theme.of(context).buttonColor;
    }
  }

  /// Display widget radio with label
  List<Widget> buildRadio() {
    List<Widget> radio = [];
    for (int index = 0; index < widget.radioLables.length; index++) {
      radio.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Radio(
              value: widget.radioValues[index],
              groupValue: currentSelectedValue,
              activeColor: colorRadio(),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (value) {
                changeValue(value, index);
              },
            ),
            GestureDetector(
              onTap: () {
                changeValue(widget.radioValues[index], index);
              },
              child: Text(widget.radioLables[index]),
            )
          ],
        ),
      );
    }
    return radio;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(unselectedWidgetColor: colorRadio()),
      child: (widget.horizontal)
          ?
          // horizontal direction
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buildRadio(),
            )
          :
          // vertical direction
          IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildRadio(),
              ),
            ),
    );
  }
}
