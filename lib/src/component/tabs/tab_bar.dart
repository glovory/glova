import 'package:flutter/material.dart';
import 'package:glukutux/color/tux_color.dart';
import 'package:glukutux/glukutux.dart';

class TuxTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// Controls the status and the color od tabbar
  final TuxStatus tuxStatus;

  /// Controls scroll of tabbar, if the value is true, can scroll.
  final bool isScrollable;

  /// Controller og tabbar
  final TabController controller;

  /// List of widget from tabbar. usually icon or text or both.
  final List<Widget> tabs;

  TuxTabBar({
    this.tuxStatus = TuxStatus.primary,
    this.isScrollable = false,
    this.controller,
    this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: isScrollable,
      controller: controller,
      indicatorColor: TuxColorUtils.colorByStatus(
          tuxStatus: tuxStatus, defaultColor: TuxColorScheme.primary),
      indicatorWeight: 2,
      labelColor: TuxColorUtils.colorByStatus(
          tuxStatus: tuxStatus, defaultColor: TuxColorScheme.primary),
      unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
      tabs: tabs,
    );
  }

  /// Height of widget
  @override
  Size get preferredSize {
    for (final Widget item in tabs) {
      if (item is TuxTab) {
        final TuxTab tab = item;
        // if text and icon not null
        if (tab.text != null && tab.icon != null)
          return Size.fromHeight(74);
      }
    }
    // if either icon or text is not null
    return Size.fromHeight(48);
  }
}
