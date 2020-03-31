import 'dart:math';

import 'package:flutter/material.dart';

import '../../../glukutux.dart';

class TuxSelect extends StatefulWidget {
  final TuxStatus tuxStatus;
  final List<String> items;
  final void Function(String) onSelect;
  final String hint;
  final double radius;
  final double width;
  final EdgeInsets padding;

  TuxSelect({
    @required this.items,
    @required this.onSelect,
    this.hint,
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
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController.dispose();
  }

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
        height: (widget.items.length * height),
        child: Material(
          color: TuxColor.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              color: Colors.white,
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
                    style: TextStyle(
                        color: TuxColor.black,
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }

  toogleOverlay() {
    if (this._overlayEntry == null) {
      showOverlay();
    } else {
      hideOverlay();
    }
  }

  showOverlay() {
    if (this._overlayEntry == null) {
      this._overlayEntry = createOverlay();
      Overlay.of(context).insert(this._overlayEntry);
      _arrowAnimationController.forward();
      setState(() {});
    }
  }

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
                  defaultColor: TuxColor.primary,
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
                    color: (value != null) ? TuxColor.black : Colors.grey),
              ),
            ),
            AnimatedBuilder(
              animation: _arrowAnimationController,
              builder: (context, child) => Transform.rotate(
                angle: _arrowAnimation.value,
                child: Icon(
                  Icons.expand_more,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
