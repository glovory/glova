import 'package:flutter/material.dart';

import '../../../glukutux.dart';

class TuxCard extends StatelessWidget {
  final TuxCardStatus tuxCardStatus;
  final TuxStatus tuxStatus;
  final String header;
  final Widget body;
  final String footer;

  const TuxCard({
    this.tuxCardStatus = TuxCardStatus.none,
    this.tuxStatus = TuxStatus.primary,
    this.header,
    @required this.body,
    this.footer,
  });

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

  Widget showBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: body,
    );
  }

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
