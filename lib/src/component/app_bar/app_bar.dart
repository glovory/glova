import 'package:flutter/material.dart';

import '../../../glukutux.dart';

/// Displayed on top of page. You can also use it with [TuxAppBar.onlyBottom] if you want no title.
class TuxAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// Title of page.
  final String title;

  /// Subtitle of page under the title. this is optional.
  final String subtitle;

  /// Custom background color
  final Color backgroundColor;

  /// Custom Style of title
  final TextStyle titleStyle;

  /// Custom Style of caption
  final TextStyle subtitleStyle;

  /// If you want the title in the center, you can set true. default true.
  final bool centerTitle;

  /// A widget on the left. usually a icon.
  final Widget leading;

  /// Widgets on the right. usually a list of icon.
  final List<Widget> actions;

  /// Widget on the botom. usually use [TuxTabBar].
  final PreferredSizeWidget bottom;

  /// Value if you want no title, this is true,
  final bool onlyBottom;

  const TuxAppBar({
    @required this.title,
    this.subtitle,
    this.centerTitle = true,
    this.leading,
    this.actions = const [],
    this.bottom,
    this.backgroundColor,
    this.titleStyle,
    this.subtitleStyle,
  }) : this.onlyBottom = false;

  const TuxAppBar.onlyBottom({
    @required this.bottom,
    this.backgroundColor,
  })  : this.titleStyle = null,
        this.subtitleStyle = null,
        this.title = null,
        this.subtitle = null,
        this.centerTitle = false,
        this.leading = null,
        this.actions = null,
        this.onlyBottom = true;

  @override
  _TuxAppBarState createState() => _TuxAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, _calculateHeight());

  /// Logic for height the appbar
  double _calculateHeight() {
    double height = 0;
    // Appbar with title
    if (!onlyBottom) {
      height += kToolbarHeight;
    }
    // Appbar with bottom
    if (bottom != null) {
      height += bottom.preferredSize.height;
    }
    return height;
  }
}

class _TuxAppBarState extends State<TuxAppBar> {
  bool hasDrawer = false;

  /// Widget leading, on the left of appbar.
  /// Can be null. if user use drawer, it display menu icon.
  /// If user on the next page, it display arrowback icon.
  /// But if leading not null, it display the widget leading
  Widget leadingAppBar(BuildContext context) {
    if (widget.leading != null) {
      return Container(
        padding: EdgeInsets.only(right: 12),
        child: widget.leading,
      );
    } else {
      if (hasDrawer) {
        return Container(
          padding: EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Icon(EvaIcons.menu),
          ),
        );
      } else if (Navigator.of(context).canPop()) {
        return Container(
          padding: EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(EvaIcons.arrowBack),
          ),
        );
      } else {
        return Container();
      }
    }
  }

  /// Widget title, by default on the center of appbar, can also be on the right leading or on the left of appbar if leading null
  /// Subtitle under ther title.it can be null.
  Widget titleAppBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.title,
          // use style title from theme
          style: widget.titleStyle == null
              ? Theme.of(context).textTheme.title
              : widget.titleStyle,
          textAlign: TextAlign.center,
        ),

        if (widget.subtitle != null) ...[
          SizedBox(height: 5),
          Text(
            widget.subtitle,
            // use style caption from theme
            style: widget.subtitleStyle == null
                ? Theme.of(context).textTheme.caption
                :  widget.subtitleStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  /// Widget leading, on the right of appbar. can be null
  Widget actionsAppBar(BuildContext context) {
    if (widget.actions != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.actions,
      );
    } else {
      return Container();
    }
  }

  /// Display this widget if value of centerTitle is true
  Widget centerTitleAppBar(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: leadingAppBar(context),
          ),
          titleAppBar(),
          Container(
            alignment: Alignment.centerRight,
            child: actionsAppBar(context),
          )
        ],
      ),
    );
  }

  /// Display this widget if value of centerTitlte is false
  Widget noCenterTitleAppBar(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      child: Row(
        children: <Widget>[
          leadingAppBar(context),
          titleAppBar(),
          Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  child: actionsAppBar(context))),
        ],
      ),
    );
  }

  /// Display this widget if bottom not null
  /// This widget under the appbar
  Widget bottomAppBar() {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                // use unselectedWidgetColor from theme
                  color: Theme.of(context).unselectedWidgetColor,
                  width: 2),
            ),
          ),
        ),
        widget.bottom
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context, nullOk: true);
    hasDrawer = scaffold?.hasDrawer ?? false;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          // use backgroundColor from theme
          color: widget.backgroundColor == null
              ? Theme.of(context).backgroundColor
              : widget.backgroundColor,
        ),
        child: Column(
          children: <Widget>[
            // if onlyBottom is false, means appbar without title
            if (!widget.onlyBottom) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: widget.centerTitle
                    ? centerTitleAppBar(context)
                    : noCenterTitleAppBar(context),
              ),
            ],
            // if widget bottom not null, show bottomAppbar
            if (widget.bottom != null) ...[
              bottomAppBar(),
            ],
          ],
        ),
      ),
    );
  }
}
