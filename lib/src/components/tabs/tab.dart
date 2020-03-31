import 'package:flutter/material.dart';

class TuxTab extends StatelessWidget {
  final IconData icon;
  final String text;

  const TuxTab({
    this.icon,
    this.text,
  }) : assert(icon != null || text != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Tab(
        iconMargin: EdgeInsets.all(4),
        icon: (icon != null) ? Icon(icon) : null,
        text: (text != null && text.isNotEmpty) ? text : null,
      ),
    );
  }
}
