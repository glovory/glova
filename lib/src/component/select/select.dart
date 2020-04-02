import 'dart:math';

import 'package:flutter/material.dart';

import '../../../glukutux.dart';

class TuxSelect extends StatefulWidget {
  /// Controls the status and the color of select
  final TuxStatus tuxStatus;

  /// List of label from select
  final List<String> items;

  /// Call this method when user selects a label in a list.
  final void Function(String) onSelect;

  /// Hint displayed inside the widget.
  final String hint;

  /// Radius to use rounded of select.
  final double radius;

  /// Width to use border width of select
  final double width;

  /// Padding to use inside the button.
  final EdgeInsets padding;

  TuxSelect({
    @required this.items,
    @required this.onSelect,
    this.hint = '',
    this.radius = 0,
    this.width = 1,
    this.padding = const EdgeInsets.all(12),
    this.tuxStatus,
  });

  @override
  _TuxSelectState createState() => _TuxSelectState();
}

class _TuxSelectState extends State<TuxSelect>
    with SingleTickerProviderStateMixin {
  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;
  String value;
  OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    // Init animation controller arrow icon
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    // Init animation arrow icon with tween animation
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose animation controller
    _arrowAnimationController.dispose();
  }

  /// Make overlay widget
  OverlayEntry createOverlay() {
    RenderBox renderBox = context.findRenderObject();
    double height = renderBox.size.height;
    double width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    double xPosition = offset.dx;
    double yPosition = offset.dy;
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        // Set height with eight of render box multiplied by the number of items
        height: (widget.items.length * height),
        child: Material(
          color: TuxColor.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              color: Theme.of(context).backgroundColor,
            ),
            padding: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.items.map((item) {
                return GestureDetector(
                  onTap: () {
                    widget.onSelect(item);
                    hideOverlay();
                    setState(() {
                      value = item;
                    });
                  },
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.normal),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }

  /// toogle overlay widget
  toogleOverlay() {
    if (this._overlayEntry == null) {
      showOverlay();
    } else {
      hideOverlay();
    }
  }

  /// show overlay widget
  showOverlay() {
    if (this._overlayEntry == null) {
      this._overlayEntry = createOverlay();
      Overlay.of(context).insert(this._overlayEntry);
      _arrowAnimationController.forward();
      setState(() {});
    }
  }

  /// hide overlay widget
  hideOverlay() {
    if (this._overlayEntry != null) {
      _arrowAnimationController.reverse();
      this._overlayEntry.remove();
      this._overlayEntry = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        border: (widget.width == 0)
            ? null
            : Border.all(
                width: widget.width,
                color: TuxColorUtils.colorByStatus(
                  tuxStatus: widget.tuxStatus,
                  defaultColor:
                      Theme.of(context).buttonColor, // button color from theme
                ),
              ),
      ),
      child: GestureDetector(
        onTap: () {
          if (widget.onSelect != null) toogleOverlay();
        },
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                value != null ? value : widget.hint,
                style: TextStyle(
                  color: (value != null)
                      ? null // default from theme
                      : Theme.of(context).hintColor, // change to hint color
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _arrowAnimationController,
              builder: (context, child) => Transform.rotate(
                angle: _arrowAnimation.value,
                child: Icon(
                  Icons.expand_more,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
