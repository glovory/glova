import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';

class TuxRadioButton extends StatefulWidget {
  final TuxStatus tuxStatus;
  final List radioValues;
  final List<String> radioLables;
  final ValueChanged<dynamic> onChanged;
  final bool horizontal;
  final bool enabled;

  const TuxRadioButton({
    this.tuxStatus = TuxStatus.primary,
    @required this.radioLables,
    @required this.radioValues,
    this.onChanged,
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

  void changeValue(dynamic value, int index) {
    if (!widget.enabled) {
      return;
    }
    widget.onChanged(widget.radioValues[index]);
    setState(() {
      currentSelectedValue = widget.radioValues[index];
    });
  }

  Color colorRadio() {
    if (widget.enabled) {
      return TuxColorUtils.colorByStatus(
        tuxStatus: widget.tuxStatus,
        defaultColor: TuxColor.primary,
      );
    } else {
      return Colors.grey;
    }
  }

  List<Widget> buildRadioRow() {
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
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buildRadioRow(),
            )
          : IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildRadioRow(),
              ),
            ),
    );
  }
}
