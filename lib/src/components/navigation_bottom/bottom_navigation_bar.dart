import 'package:flutter/material.dart';
import 'package:glukutux/src/components/navigation_bottom/bottom_navigation_bar_item.dart';

import '../../../glukutux.dart';

class TuxBottomNavigationBar extends StatelessWidget {
  /// Controls the status and the color of the selected icon and text from bottomnavigation.
  final TuxStatus tuxStatus;

  /// To use selected index value. default is 0.
  final int selectedIndex;

  /// List item of bottomnavigation.
  final List<TuxBottomNavigationBarItem> items;

  /// Call this method when the selected index value is change.
  final Function(int) onItemSelected;

  const TuxBottomNavigationBar({
    this.tuxStatus = TuxStatus.primary,
    this.selectedIndex = 0,
    @required this.items,
    @required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: kBottomNavigationBarHeight,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: items.map((item) {
            var index = items.indexOf(item);
            return GestureDetector(
              // call method onItemSelected when user tap this widget
              onTap: () => onItemSelected(index),
              child: Container(
                height: double.infinity,
                // The width is the width of screen minus the number of items
                width: MediaQuery.of(context).size.width / items.length,
                child: Stack(
                  children: <Widget>[
                    // Line of bottom navigation
                    Container(
                      color: (selectedIndex == index)
                          ? TuxColorUtils.colorByStatus(
                              tuxStatus: tuxStatus,
                              defaultColor: TuxColor.primary)
                          : Colors.grey,
                      height: 3,
                    ),
                    // Widget of bottom navigation
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 3,
                          ),
                          // Show Icon if icon not null
                          if (item.icon != null) ...[
                            Icon(
                              item.icon,
                              color: (selectedIndex == index)
                                  ? TuxColorUtils.colorByStatus(
                                      tuxStatus: tuxStatus,
                                      defaultColor: TuxColor.primary)
                                  : Colors.grey,
                            ),
                          ],
                          // Show title if title not null and title is not empty
                          if (item.title != null && item.title.isNotEmpty) ...[
                            Text(
                              item.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: (selectedIndex == index)
                                    ? TuxColorUtils.colorByStatus(
                                        tuxStatus: tuxStatus,
                                        defaultColor: TuxColor.primary)
                                    : Colors.grey,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
