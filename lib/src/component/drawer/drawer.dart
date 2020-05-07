import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

/// The possible alignments of a TuxDrawer.
enum TuxDrawerAlignment {
  /// It makes left side when the text direction is left-to-right
  /// and the right side when the text direction is right-to-left.
  start,

  /// It makes right side when the text direction is left-to-right
  /// and the left side when the text direction is right-to-left.
  end,
}


const double _kWidth = 304;

class TuxDrawer extends StatelessWidget {
  /// Typically used in the Scaffold.drawer property.
  ///
  /// The elevation must be non-negative.
  ///
  const TuxDrawer({
    Key key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    this.backgroundImage,
    this.colorFilter,
    this.gradient,
    this.color,
  })  : assert(elevation != null && elevation >= 0.0),
        super(key: key);


  /// Control the size of the shadow below the drawer.
  /// Defaults to 16, the appropriate elevation for drawers. The value is
  /// always non-negative.
  final double elevation;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the drawer is opened and closed.
  ///
  /// If this label is not provided, it will default to
  /// MaterialLocalizations.drawerLabel.
  final String semanticLabel;

  /// Background image can be added.
  final ImageProvider backgroundImage;

  /// A composited layer that applies a color filter to its children.
  final ColorFilter colorFilter;

  ///  The Gradient can be used for transforming gradient.
  final Gradient gradient;

  /// Defines the background color of the drawer
  final Color color;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String label = semanticLabel;
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
        label = semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = semanticLabel ?? MaterialLocalizations.of(context)?.drawerLabel;
        break;
      default:
        break;
    }
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(width: _kWidth),
        child: Material(
          elevation: elevation,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              gradient: gradient,
              image: backgroundImage != null
                  ? DecorationImage(
                image: backgroundImage,
                fit: BoxFit.cover,
                colorFilter: colorFilter,
              )
                  : null,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
