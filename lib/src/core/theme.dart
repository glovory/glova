import 'package:flutter/widgets.dart';

import 'theme_data.dart';

class OvaTheme extends InheritedTheme {
  /// The required [OvaThemeData] for the theme widget
  final OvaThemeData data;

  OvaTheme({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(data != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(OvaTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return child;
  }

  /// The closest instance of this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// TuxThemeData theme = TuxTheme.of(context);
  /// ```
  static OvaThemeData of(BuildContext context) {
    final OvaTheme theme =
        context.dependOnInheritedWidgetOfExactType<OvaTheme>();

    return theme.data;
  }
}
