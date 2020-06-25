import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../glova.dart';

/// Ova Design text theme
/// definition for typography of Eva Design
///
/// ```
/// NAME        SIZE   WEIGHT     HEIGHT
/// headline1   36.0   bold       48/36
/// headline2   32.0   bold       40/32
/// headline3   30.0   bold       40/30
/// headline4   26.0   bold       32/26
/// headline5   22.0   bold       32/22
/// headline6   18.0   bold       24/18
/// subtitle1   15.0   semi bold  24/15
/// subtitle2   13.0   semi bold  24/13
/// paragraph1  15.0   regular    20/15
/// paragraph2  13.0   regular    18/13
/// caption1    12.0   regular    16/12
/// caption2    12.0   semi bold  16/12
/// label       12.0   bold       16/12
/// button
///   giant     18.0   bold       24/18
///   large     16.0   bold       20/16
///   medium    14.0   bold       16/14
///   small     12.0   bold       16/12
///   tiny      10.0   bold       12/10
///
/// ```
///

OvaTextTheme _textThemeFallback({
  OvaTextTheme textTheme,
}) {
  final defaultTextTheme = OvaTextTheme.defaultTextTheme();
  return OvaTextTheme(
    headline1: textTheme.headline1 ?? defaultTextTheme.headline1,
    headline2: textTheme.headline2 ?? defaultTextTheme.headline2,
    headline3: textTheme.headline3 ?? defaultTextTheme.headline3,
    headline4: textTheme.headline4 ?? defaultTextTheme.headline4,
    headline5: textTheme.headline5 ?? defaultTextTheme.headline5,
    headline6: textTheme.headline6 ?? defaultTextTheme.headline6,
    subtitle1: textTheme.subtitle1 ?? defaultTextTheme.subtitle1,
    subtitle2: textTheme.subtitle2 ?? defaultTextTheme.subtitle2,
    paragraph1: textTheme.paragraph1 ?? defaultTextTheme.paragraph1,
    paragraph2: textTheme.paragraph2 ?? defaultTextTheme.paragraph2,
    caption1: textTheme.caption1 ?? defaultTextTheme.caption1,
    caption2: textTheme.caption2 ?? defaultTextTheme.caption2,
    label: textTheme.label ?? defaultTextTheme.label,
    button: _textThemeButtonFallback(
      textButton: textTheme.button ?? defaultTextTheme.button,
      defaultTextButton: defaultTextTheme.button,
    ),
  );
}

Map<OvaButtonSize, TextStyle> _textThemeButtonFallback({
  Map<OvaButtonSize, TextStyle> textButton,
  Map<OvaButtonSize, TextStyle> defaultTextButton,
}) {
  return <OvaButtonSize, TextStyle>{
    OvaButtonSize.giant: textButton.containsKey(OvaButtonSize.giant)
        ? textButton[OvaButtonSize.giant]
        : defaultTextButton[OvaButtonSize.giant],
    OvaButtonSize.large: textButton.containsKey(OvaButtonSize.large)
        ? textButton[OvaButtonSize.large]
        : defaultTextButton[OvaButtonSize.large],
    OvaButtonSize.medium: textButton.containsKey(OvaButtonSize.medium)
        ? textButton[OvaButtonSize.medium]
        : defaultTextButton[OvaButtonSize.medium],
    OvaButtonSize.small: textButton.containsKey(OvaButtonSize.small)
        ? textButton[OvaButtonSize.small]
        : defaultTextButton[OvaButtonSize.small],
    OvaButtonSize.tiny: textButton.containsKey(OvaButtonSize.tiny)
        ? textButton[OvaButtonSize.tiny]
        : defaultTextButton[OvaButtonSize.tiny],
  };
}

@immutable
class OvaTextTheme with Diagnosticable {
  final TextStyle headline1;

  final TextStyle headline2;

  final TextStyle headline3;

  final TextStyle headline4;

  final TextStyle headline5;

  final TextStyle headline6;

  final TextStyle subtitle1;

  final TextStyle subtitle2;

  final TextStyle paragraph1;

  final TextStyle paragraph2;

  final TextStyle caption1;

  final TextStyle caption2;

  final TextStyle label;

  /// Used for text OvaButton
  final Map<OvaButtonSize, TextStyle> button;

  OvaTextTheme({
    this.headline1,
    this.headline2,
    this.headline3,
    this.headline4,
    this.headline5,
    this.headline6,
    this.subtitle1,
    this.subtitle2,
    this.paragraph1,
    this.paragraph2,
    this.caption1,
    this.caption2,
    this.label,
    this.button,
  });

  /// default text theme of ova
  factory OvaTextTheme.defaultTextTheme() {
    return OvaTextTheme(
      headline1: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, height: 48 / 36),
      headline2: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, height: 40 / 32),
      headline3: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, height: 40 / 30),
      headline4: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, height: 32 / 26),
      headline5: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 32 / 22),
      headline6: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, height: 24 / 18),
      subtitle1: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 24 / 15),
      subtitle2: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 24 / 13),
      paragraph1: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 20 / 15),
      paragraph2: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, height: 18 / 13),
      caption1: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 16 / 12),
      caption2: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, height: 16 / 12),
      label: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, height: 16 / 12),
      button: {
        OvaButtonSize.giant: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, height: 24 / 18),
        OvaButtonSize.large: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, height: 20 / 16),
        OvaButtonSize.medium: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, height: 16 / 14),
        OvaButtonSize.small: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, height: 16 / 12),
        OvaButtonSize.tiny: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, height: 10 / 10),
      },
    );
  }

  factory OvaTextTheme.merge({OvaTextTheme textTheme}) {
    return _textThemeFallback(textTheme: textTheme);
  }

  OvaTextTheme copyWith({
    TextStyle headline1,
    TextStyle headline2,
    TextStyle headline3,
    TextStyle headline4,
    TextStyle headline5,
    TextStyle headline6,
    TextStyle subtitle1,
    TextStyle subtitle2,
    TextStyle paragraph1,
    TextStyle paragraph2,
    TextStyle caption1,
    TextStyle caption2,
    TextStyle label,
    Map<OvaButtonSize, TextStyle> button,
  }) {
    return OvaTextTheme(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      headline3: headline3 ?? this.headline3,
      headline4: headline4 ?? this.headline4,
      headline5: headline5 ?? this.headline5,
      headline6: headline6 ?? this.headline6,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      paragraph1: paragraph1 ?? this.paragraph1,
      paragraph2: paragraph2 ?? this.paragraph2,
      caption1: caption1 ?? this.caption1,
      caption2: caption2 ?? this.caption2,
      label: label ?? this.label,
      button: button ?? this.button,
    );
  }

  OvaTextTheme apply({
    String fontFamily,
    double fontSizeFactor = 1.0,
    double fontSizeDelta = 0.0,
    Color displayColor,
    Color bodyColor,
    TextDecoration decoration,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
  }) {
    return OvaTextTheme(
      headline1: headline1?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headline2: headline2?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headline3: headline3?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headline4: headline4?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headline5: headline5?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headline6: headline6?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      subtitle1: subtitle1?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      subtitle2: subtitle2?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      paragraph1: paragraph1?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      paragraph2: paragraph2?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      caption1: caption1?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      caption2: caption2?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      label: label?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      button: {
        OvaButtonSize.giant: button[OvaButtonSize.giant]?.apply(
          color: displayColor,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontFamily: fontFamily,
          fontSizeFactor: fontSizeFactor,
          fontSizeDelta: fontSizeDelta,
        ),
        OvaButtonSize.large: button[OvaButtonSize.large]?.apply(
          color: displayColor,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontFamily: fontFamily,
          fontSizeFactor: fontSizeFactor,
          fontSizeDelta: fontSizeDelta,
        ),
        OvaButtonSize.medium: button[OvaButtonSize.medium]?.apply(
          color: displayColor,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontFamily: fontFamily,
          fontSizeFactor: fontSizeFactor,
          fontSizeDelta: fontSizeDelta,
        ),
        OvaButtonSize.small: button[OvaButtonSize.small]?.apply(
          color: displayColor,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontFamily: fontFamily,
          fontSizeFactor: fontSizeFactor,
          fontSizeDelta: fontSizeDelta,
        ),
        OvaButtonSize.tiny: button[OvaButtonSize.tiny]?.apply(
          color: displayColor,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontFamily: fontFamily,
          fontSizeFactor: fontSizeFactor,
          fontSizeDelta: fontSizeDelta,
        ),
      },
    );
  }
}
