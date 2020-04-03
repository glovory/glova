# glukutux

UI design library implementation of Eva Design System

## Getting Started


### Depend on it

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  glukutux:
      git:
        url: https://github.com/glovory/glukutux.git
```


### Install it

You can install packages from the command line:

```bash
$ flutter pub get
```


### Import it

Now in your Dart code, you can use:

```dart
import 'package:glukutux/glukutux.dart';
```


### Setup

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


### Use it

Every widget in **Glukutux** is prefixed with `Tux`. For example, `TuxButton`, `TuxCard`, etc.

```dart
TuxButton(
  onPressed: () {},
  label: 'Hallo Glukutux',
  tuxStatus: TuxStatus.primary,
  tuxAppearance: TuxAppearance.filled,
  tuxShape: TuxShape.circle,
),
```


## Icons

The [Eva Icons Flutter](https://github.com/piyushmaurya23/eva_icons_flutter) package is already integrated into Glukutux, so you can use it right away by using `EvaIcons`.


## From Developers
Made with :heart: by **Glovory**

