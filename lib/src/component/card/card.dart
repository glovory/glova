import 'package:flutter/material.dart';

import '../../../glukutux.dart';

class TuxCard extends StatelessWidget {
  /// Controls the appearance of card. It can be either none, strip, or header.
  final TuxCardStatus tuxCardStatus;

  /// Controls the status and the color of card.
  final TuxStatus tuxStatus;

  /// Header of card.
  final String header;

  /// Widget to use body of card.
  final Widget body;

  /// Footer of card.
  final String footer;

  const TuxCard({
    this.tuxCardStatus = TuxCardStatus.none,
    this.tuxStatus = TuxStatus.primary,
    this.header,
    @required this.body,
    this.footer,
  });

  /// Display this widget if cardstatus is none
  Widget noneCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            header,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 1,
          // change color to button color from theme
          color: Theme.of(context).buttonColor,
        ),
      ],
    );
  }

  /// Display this widget if cardstatus is strip
  Widget stripCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 8,
          color: TuxColorUtils.colorByStatus(
            tuxStatus: tuxStatus,
            defaultColor: TuxColor.primary,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            header,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 1,
          // change color to button color from theme
          color: Theme.of(context).buttonColor,
        ),
      ],
    );
  }

  /// Display this widget if cardstatus is header
  Widget headerCard(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: TuxColorUtils.colorByStatus(
                tuxStatus: tuxStatus,
                defaultColor: TuxColor.primary,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              header,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Display this widget if body not null
  Widget showBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: body,
    );
  }

  /// Display this widget if footer not null
  Widget showFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 1,
          // change color to button color from theme
          color: Theme.of(context).buttonColor,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(footer),
        ),
      ],
    );
  }

  /// Card header by cardstatus
  Widget showHeader(BuildContext context, {TuxCardStatus cardStatus}) {
    switch (cardStatus) {
      case TuxCardStatus.none:
        return noneCard(context);
      case TuxCardStatus.strip:
        return stripCard(context);
      case TuxCardStatus.header:
        return headerCard(context);
      default:
        return noneCard(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Container(
              color: Theme.of(context).cardColor,
//              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (header != null && header.isNotEmpty) ...[
                    showHeader(context, cardStatus: tuxCardStatus),
                  ],
                  showBody(),
                  if (footer != null && footer.isNotEmpty) ...[
                    showFooter(context),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
