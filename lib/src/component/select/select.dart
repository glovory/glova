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

  /// Init value of select
  final String initialValue;

  /// Hint displayed inside the widget.
  final String hint;

  /// Radius to use rounded of select.
  final double radius;

  /// Width to use border width of select
  final double thickness;

  /// Padding to use inside the button.
  final EdgeInsets padding;

  /// appearance of select
  final TuxAppearance tuxAppearance;

  TuxSelect({
    @required this.items,
    @required this.onSelect,
    this.initialValue,
    this.hint = '',
    this.radius = 0,
    this.thickness = 1,
    this.padding = const EdgeInsets.all(12),
    this.tuxStatus,
    this.tuxAppearance = TuxAppearance.outline,
  });

  @override
  _TuxSelectState createState() => _TuxSelectState();
}

class _TuxSelectState extends State<TuxSelect> with SingleTickerProviderStateMixin {
  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;
  String value;
  OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool openingFromBottom;

  @override
  void initState() {
    super.initState();
    // Init animation controller arrow icon
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    // Init animation arrow icon with tween animation
    _arrowAnimation = Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
    value = widget.initialValue;
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose animation controller
    _arrowAnimationController.dispose();
    hideOverlay();
  }

  // Make overlay widget
  OverlayEntry createOverlay() {
    RenderBox renderBox = context.findRenderObject();

    double height = renderBox.size.height;
    double width = renderBox.size.width;

    Offset offset = renderBox.localToGlobal(Offset.zero);

    double yPosition = offset.dy;

    Size screen = MediaQuery.of(context).size;
    double navBar = MediaQuery.of(context).padding.bottom;

    final bottom = screen.height - yPosition - height - navBar;
    final heightAll = height * widget.items.length;

    double dx = -widget.padding.left;
    double dy;
    if (heightAll >= bottom) {
      openingFromBottom = false;
      dy = -(height * widget.items.length) - (1.5 * widget.padding.vertical);
    } else {
      openingFromBottom = true;
      dy = height - (0.5 * widget.padding.vertical);
    }

    return OverlayEntry(
        builder: (context) => Positioned(
              width: width,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(dx, dy),
                child: Material(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: widget.padding.vertical),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: [
                          ...(widget.items)
                              .map(
                                (item) => GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: widget.padding.left, right: widget.padding.right),
                                    height: height,
                                    width: width,
                                    child: Text('$item'),
                                  ),
                                  onTap: () {
                                    print('$item Tapped');
                                    widget.onSelect(item);
                                    hideOverlay();
                                    setState(() {
                                      value = item;
                                    });
                                  },
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
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

      Future.delayed(Duration(milliseconds: 100), () {
        this._overlayEntry.remove();
        this._overlayEntry = null;
        setState(() {});
      });
    }
  }

  BoxDecoration boxDecoration({TuxAppearance appearance}) {
    switch (appearance) {
      case TuxAppearance.filled:
        return BoxDecoration(
          color: TuxColorUtils.colorByStatus(
            tuxStatus: widget.tuxStatus,
            defaultColor: Theme.of(context).buttonColor, // button color from theme
          ),
          borderRadius: BorderRadius.circular(widget.radius),
          border: (widget.thickness == 0)
              ? null
              : Border.all(
                  width: widget.thickness,
                  color: TuxColorUtils.colorByStatus(
                    tuxStatus: widget.tuxStatus,
                    defaultColor: Theme.of(context).buttonColor, // button color from theme
                  ),
                ),
        );
        break;
      case TuxAppearance.outline:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          border: (widget.thickness == 0)
              ? null
              : Border.all(
                  width: widget.thickness,
                  color: TuxColorUtils.colorByStatus(
                    tuxStatus: widget.tuxStatus,
                    defaultColor: Theme.of(context).buttonColor, // button color from theme
                  ),
                ),
        );
        break;
      case TuxAppearance.ghost:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
        );
        break;
      default:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          border: (widget.thickness == 0)
              ? null
              : Border.all(
                  width: widget.thickness,
                  color: TuxColorUtils.colorByStatus(
                    tuxStatus: widget.tuxStatus,
                    defaultColor: Theme.of(context).buttonColor, // button color from theme
                  ),
                ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: widget.padding,
      decoration: boxDecoration(appearance: widget.tuxAppearance),
      child: CompositedTransformTarget(
        link: _layerLink,
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
                        ? (widget.tuxAppearance == TuxAppearance.filled)
                            ? Colors.white
                            : null // default from theme
                        : (widget.tuxAppearance == TuxAppearance.filled)
                            ? Colors.white.withOpacity(0.5)
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
                    color: (widget.tuxAppearance == TuxAppearance.filled) ? Colors.white : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
