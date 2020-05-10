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

### Eva Design Color Converter
1. Put file "eva_theme.json" that contains eva design color themes in the root of your project.
2. Run `flutter pub run glukutux:generate_color`.
3. By default file that have been successfully created will be placed in `lib/tux_color.dart`.
4. Import your generate file to your page.
5. Use Tux Color Scheme with `TuxColorScheme.primary` or with number shade like `TuxColorScheme.primary.shade100`


####  Command arguments Color Converter

The default JSON input file directory is ` ./eva_theme.json`,
you can custom input file directory by `-i` argument, for example:

```shell
flutter pub run glukutux:generate_color -i json_files
or
flutter pub run glukutux:generate_color --input json_files
```

You can also custom the output directory by `-o` argument:

```shell
flutter pub run glukutux:generate_color -o dart_file
or
flutter pub run glukutux:generate_color --output dart_file
```
or custom both of them

```shell
flutter pub run glukutux:generate_color -i json_files -o dart_file
or
flutter pub run glukutux:generate_color --input json_files --output dart_file
```

## Icons

The [Eva Icons Flutter](https://github.com/piyushmaurya23/eva_icons_flutter) package is already integrated into Glukutux, so you can use it right away by using `EvaIcons`.


## From Developers
Made with :heart: by **Glovory**

