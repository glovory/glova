import 'package:flutter/material.dart';

import '../../../glukutux.dart';

class TuxAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final bool centerTitle;
  final Widget leading;
  final List<Widget> actions;

  TuxAppBar({
    @required this.title,
    this.subtitle,
    this.centerTitle = true,
    this.leading,
    this.actions = const [],
  });

  @override
  _TuxAppBarState createState() => _TuxAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}

class _TuxAppBarState extends State<TuxAppBar> {
  bool hasDrawer = false;

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

  Widget titleAppBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff1a2138),
          ),
          textAlign: TextAlign.center,
        ),
        if (widget.subtitle != null) ...[
          Text(
            widget.subtitle,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff8f9bb3),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

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

  Widget centerTitleAppBar(BuildContext context) {
    return Stack(
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
    );
  }

  Widget noCenterTitleAppBar(BuildContext context) {
    return Row(
      children: <Widget>[
        leadingAppBar(context),
        titleAppBar(),
        Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: actionsAppBar(context))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context, nullOk: true);
    hasDrawer = scaffold?.hasDrawer ?? false;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: widget.centerTitle
            ? centerTitleAppBar(context)
            : noCenterTitleAppBar(context),
      ),
    );
  }
}
