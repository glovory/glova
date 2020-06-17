# glova

Flutter UI component based on [Eva Design System](https://eva.design) by [Glovory](https://glovory.com)

> Eva Design is a trademark of Akveo LLC

## Installation

This project is still under heavy development. You can try this library by defining git dependency like this:

```yaml
dependencies:
  glova:
    git:
      url: https://github.com/glovory/glova.git
```

All the components can be accessible by importing

```dart
import 'package:glova/glova.dart';
```

## Initial Configuration

-- old documentation --

You have to replace `MaterialApp` or `CupertinoApp` with `GlovaApp`. by default theme of Glova is lightTheme, but you can change with `OvaTheme.darkTheme` if you want to dark mode or `OvaTheme.customTheme` if you want to custom theme

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OvaApp(
      theme: OvaTheme.lightTheme,
      title: 'Glova',
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

### Change default color

Change the file in `assets/default-color.json`, then call the command

```shell script
flutter pub run eva_color:generate -i assets/default-color.json -o lib/src/core/default_color.dart -c OvaColor
```

## From Developers

Made with :heart: by **Glovory** Mobile Tech Team 
