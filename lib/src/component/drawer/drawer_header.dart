import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';
import 'package:glukutux/src/model/params.dart';

class TuxDrawerHeaderComponents extends StatelessWidget {
  const TuxDrawerHeaderComponents({
    Key key,
    this.componentInTopRight,
    this.closeButton,
  }) : super(key: key);

  /// A list of widgets can be represent the another user's accounts or other widget.
  /// Normally a list of CircleAvatar widgets or something else
  final List<Widget> componentInTopRight;

  /// widget onTap drawer get closed
  final Widget closeButton;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          closeButton == null
              ? TuxIconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tuxAppearance: TuxAppearance.ghost,
                )
              : closeButton,
          PositionedDirectional(
            top: 0,
            end: 0,
            child: Row(
              children: (componentInTopRight ?? <Widget>[])
                  .take(3)
                  .map<Widget>((Widget picture) => Padding(
                        padding: const EdgeInsetsDirectional.only(start: 8),
                        child: Semantics(
                          container: true,
                          child: Container(
                            padding: const EdgeInsets.only(left: 8, bottom: 8),
                            width: 48,
                            height: 48,
                            child: picture,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      );
}

/// Drawer header that identifies the app's user.
///
class TuxDrawerHeader extends StatefulWidget {
  const TuxDrawerHeader({
    Key key,
    this.decoration,
    this.margin = const EdgeInsets.only(bottom: 8),
    this.otherComponentInTopRight,
    this.child,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.fastOutSlowIn,
    this.closeButton,
  }) : super(key: key);

  /// The header's background. If decoration is null
  /// set to the current theme's primaryColor is used.
  final Decoration decoration;

  /// The margin around the drawer header.
  final EdgeInsetsGeometry margin;

  /// A list of widgets can be represent the another user's accounts or other widget.
  /// Normally a list of CircleAvatar widgets or something else
  final List<Widget> otherComponentInTopRight;

  /// A widget to be placed inside the drawer header.
  final Widget child;

  /// The duration for animations of the decoration.
  final Duration duration;

  /// The curve for animations of the decoration.
  final Curve curve;

  /// widget onTap drawer get closed
  final Widget closeButton;

  @override
  _TuxDrawerHeaderState createState() => _TuxDrawerHeaderState();
}

class _TuxDrawerHeaderState extends State<TuxDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Semantics(
      container: true,
      label: MaterialLocalizations.of(context).signedInLabel,
      child: Container(
        height: statusBarHeight + 185.0,
        decoration: widget.decoration ??
            BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
        margin: widget.margin,
        padding: const EdgeInsetsDirectional.only(top: 16, start: 16),
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: TuxDrawerHeaderComponents(
                    componentInTopRight: widget.otherComponentInTopRight,
                    closeButton: widget.closeButton,
                  ),
                ),
              ),
              AnimatedContainer(
                padding: const EdgeInsets.only(bottom: 16),
                duration: widget.duration,
                curve: widget.curve,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
