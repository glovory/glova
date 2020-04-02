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
  Widget noneCard() {
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
          color: Colors.grey[200],
        ),
      ],
    );
  }

  /// Display this widget if cardstatus is strip
  Widget stripCard() {
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
          color: Colors.grey[200],
        ),
      ],
    );
  }

  /// Display this widget if cardstatus is header
  Widget headerCard() {
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
  Widget showFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 1,
          color: Colors.grey[200],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(footer),
        ),
      ],
    );
  }

  /// Card header by cardstatus
  Widget showHeader({TuxCardStatus cardStatus}) {
    switch (cardStatus) {
      case TuxCardStatus.none:
        return noneCard();
      case TuxCardStatus.strip:
        return stripCard();
      case TuxCardStatus.header:
        return headerCard();
      default:
        return noneCard();
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
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (header != null && header.isNotEmpty) ...[
                    showHeader(cardStatus: tuxCardStatus),
                  ],
                  showBody(),
                  if (footer != null && footer.isNotEmpty) ...[
                    showFooter(),
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
