import 'package:flutter/material.dart';
import 'package:glukutux/src/components/navigation_bottom/bottom_navigation_bar_item.dart';

import '../../../glukutux.dart';

class TuxBottomNavigationBar extends StatelessWidget {
  final TuxStatus tuxStatus;
  final int selectedIndex;
  final List<TuxBottomNavigationBarItem> items;
  final ValueChanged<int> onItemSelected;

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
              onTap: () => onItemSelected(index),
              child: Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width / items.length,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: (selectedIndex == index)
                          ? TuxColorUtils.colorByStatus(
                              tuxStatus: tuxStatus,
                              defaultColor: TuxColor.primary)
                          : Colors.grey,
                      height: 3,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 3,),
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
