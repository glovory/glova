import 'package:flutter/material.dart';
import 'package:glukutux/glukutux.dart';

class TuxTabBar extends StatelessWidget implements PreferredSizeWidget {

  final TuxStatus tuxStatus;
  final bool isScrollable;
  final TabController controller;
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
          tuxStatus: tuxStatus, defaultColor: TuxColor.background_default),
      indicatorWeight: 2,
      labelColor: TuxColorUtils.colorByStatus(
          tuxStatus: tuxStatus, defaultColor: TuxColor.background_default),
      unselectedLabelColor: Colors.grey,
      tabs: tabs,
    );
  }

  @override
  Size get preferredSize {
    for (final Widget item in tabs) {
      if (item is TuxTab) {
        final TuxTab tab = item;
        if (tab.text != null && tab.icon != null)
          return Size.fromHeight(74);
      }
    }
    return Size.fromHeight(48);
  }
}
