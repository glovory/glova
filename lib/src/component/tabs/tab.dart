import 'package:flutter/material.dart';

class TuxTab extends StatelessWidget {
  /// Icon of tab
  final IconData icon;

  /// Label of tab
  final String text;

  const TuxTab({
    this.icon,
    this.text,
  }) : assert(icon != null || text != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Tab(
        // display icon if icon not null
        icon: (icon != null) ? Icon(icon) : null,
        // display lable if text is not null and text is not empty
        text: (text != null && text.isNotEmpty) ? text : null,
      ),
    );
  }
}
