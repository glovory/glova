# glukutux

Flutter UI component based on [Eva Design System](https://eva.design)

> Eva Design is a trademark of Akveo LLC

## Installation

This project is still under heavy development. You can try this library by defining git dependency like this:

```yaml
dependencies:
  glukutux:
    git:
      url: https://github.com/glovory/glukutux.git
```

All the components can be accessible by importing

```dart
import 'package:glukutux/glukutux.dart';
```

## Initial Configuration

-- old documentation --

You have to replace `MaterialApp` or `CupertinoApp` with `GlukutuxApp`. by default theme of Glukutux is lightTheme, but you can change with `TuxTheme.darkTheme` if you want to dark mode or `TuxTheme.customTheme` if you want to custom theme

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlukutuxApp(
      theme: TuxTheme.lightTheme,
      title: 'Glukutux',
      home: HomePage(),
    );
  }
}
```

-- end of old documentation --

## Functionality & Components

### Functionality

[ ] Theming
[x] Color generator, provided by [Eva Color](https://pub.dev/packages/eva_color)
[ ] Example project and apk

### Components

[ ] AppBar
[ ] Avatar
[ ] Buttons
  [ ] Regular
  [ ] Icon
  [ ] Outline
  [ ] Flat
[ ] Card
[ ] Checkbox
[ ] Image
[ ] Bottom Navigation
[ ] Radio Button
[ ] Select
[ ] Tab
[ ] Text form field
[ ] Toggle
[ ] Tooltip
[ ] Popover
[ ] Drawer
[ ] Spinner

## For Contributors / Developers

We encourage you to develop using Android Studio, as we also push the changes of `.idea` directory, which owned by Intellij platform.

The step to start development:

1. Checkout the latest master source.
2. Open the project using Android Studio.
3. Go to menu `File -> Settings -> Appearance & Behavior -> Path Variables`.
4. Set the `FLUTTER_SDK` path variable to your Flutter SDK directory.

These ensure the project contributions to be on the same table. Happy code!

## From Developers

Made with :heart: by **Glovory** Mobile Tech Team 
