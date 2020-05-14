import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  /// Positon of radio button
  final String position;

  /// Padding of container
  final EdgeInsets padding;

  /// Padding of label
  final EdgeInsets labelPadding;

  const TuxRadioButton({
    this.tuxStatus = TuxStatus.primary,
    @required this.radioLables,
    @required this.radioValues,
    @required this.onChanged,
    this.horizontal = false,
    this.enabled = true,
    this.position = 'none',
    this.padding = const EdgeInsets.all(0),
    this.labelPadding = const EdgeInsets.all(0)
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
        defaultColor: TuxColor.primary,
      );
    } else {
      // change color to button color from theme
      return Theme.of(context).buttonColor;
    }
  }

  /// Set position of radio button
  Widget setPosition(String position, int index) {
    /// radio + label component
    Widget wholeComponent = null;

    /// Radio component
    Widget radio =  Radio(
      value: widget.radioValues[index],
      groupValue: currentSelectedValue,
      activeColor: colorRadio(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: (value) {
        changeValue(value, index);
      },
    );

    /// Label component
    Widget label = GestureDetector(
      onTap: () {
        changeValue(widget.radioValues[index], index);
      },
      child: Padding(
        padding: widget.labelPadding,
        child: Text(widget.radioLables[index]),
      ),
    );

    switch(position) {
      case 'none':
        wholeComponent = Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            radio,
            label
          ],
        );
        break;

      case 'left':
        wholeComponent = Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            radio,
            label
          ],
        );
        break;

      case 'right':
        wholeComponent = Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            label,
            radio
          ],
        );
        break;

      default:
        wholeComponent = Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            radio,
            label
          ],
        );
        break;
    }

    return Padding(
      padding: widget.padding,
      child: wholeComponent,
    );
  }

  /// Display widget radio with label
  List<Widget> buildRadio() {
    List<Widget> radio = [];
    for (int index = 0; index < widget.radioLables.length; index++) {
      radio.add(
        setPosition(widget.position, index)
      );
    }
    return radio;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(unselectedWidgetColor: colorRadio()),
      child: Container(
        alignment: Alignment.topLeft,
        child: (widget.horizontal)
            ?
            // horizontal direction
            Wrap(
                direction: Axis.horizontal,
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
      ),
    );
  }
}
