import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:mime/mime.dart';

const tpl =
    "import 'dart:ui';\nimport 'package:glukutux/glukutux.dart';\n\n\n//@auto generate do not edit\nclass TuxColorScheme {";

void main(List<String> args) {
  String src;
  String dist;

  ArgParser parser = new ArgParser();
  parser.addOption('input', abbr: 'i', defaultsTo: './json_data/data.json',
      callback: (value) {
    return src = value;
  }, help: "Specify the json directory.");
  parser.addOption('output', abbr: 'o', defaultsTo: 'lib/color/tux_color.dart',
      callback: (value) {
    return dist = value;
  }, help: "Specify the output directory.");
  parser.addFlag('help', abbr: 'h', help: 'Usage help', negatable: false);
  final arg = parser.parse(args);

  if (arg['help']) {
    stdout.writeln('Eva Design Color Converter');
    stdout.writeln(parser.usage);
    exit(0);
  }

  File inputFile = new File(src);
//validate input file exist
  if (inputFile.existsSync()) {
    // validate output path is valid.
    if (isOutputPathValid(dist)) {
      // validate file input is json
      if (checkingFileJson(src)) {
        // validate output file is dart
        if (checkingFileDart(dist)) {
          //generate file
          if (generateFile(inputFile, dist)) {
            print('successfully generate file');
          } else {
            print('generate file failed');
          }
        } else {
          print('output file type must be dart!');
        }
      } else {
        print('input file type must be json!');
      }
    }
  } else {
    print('File is not exist!');
  }
}

///validate input is json file
bool checkingFileJson(String path) {
  String mimeStr = lookupMimeType(path);
  List<String> fileType = mimeStr.split('/');
  if (fileType.last == 'json') {
    return true;
  } else {
    return false;
  }
}

///validate output directory is under lib
bool isOutputPathValid(String path) {
  Directory myDir = new Directory(path);
  try {
    List<String> fileType = myDir.uri.toString().split('/');
    if ((fileType[0] == 'lib' || fileType[1] == 'lib') &&
        !path.contains('../')) {
      return permissionAccess(path);
    } else {
      print(
          'Output directory is not valid. Output directory must be under /lib');
      return false;
    }
  } catch (error) {
    print('Output directory is not valid. Output directory must be under /lib');
    return false;
  }
}

///validate permission access
bool permissionAccess(String path) {
  File outputFile = new File(path);
  // check file exists or not
  if (!outputFile.existsSync()) {
    return true;
  }
  //if exist continue to validate
  else {
    print(outputFile.statSync().mode.toRadixString(8));
    if (outputFile.statSync().mode.toRadixString(8) == '100666'||
        outputFile.statSync().mode.toRadixString(8) == '100660'||
        outputFile.statSync().mode.toRadixString(8) == '100600') {
      return true;
    } else {
      print('You have no permission in file output');
      return false;
    }
  }
}

///validate output is dart file
bool checkingFileDart(String path) {
  String mimeStr = lookupMimeType(path);
  List<String> fileType = mimeStr.split('/');
  if (fileType.last == 'x-dart') {
    return true;
  } else {
    return false;
  }
}

bool generateFile(File file, String outputPath) {
  File files = file;
  String output = outputPath;
  Map<String, dynamic> map;
  try {
    map = json.decode(files.readAsStringSync());
  } catch (error) {
    print('invalid format json!');
    return false;
  }

  /// initialization of variable StringBuffer for write files
  StringBuffer sinkColorPrimary = new StringBuffer();
  StringBuffer sinkColorSuccess = new StringBuffer();
  StringBuffer sinkColorInfo = new StringBuffer();
  StringBuffer sinkColorWarning = new StringBuffer();
  StringBuffer sinkColorDanger = new StringBuffer();
  StringBuffer sinkColorPrimaryTransparent = new StringBuffer();
  StringBuffer sinkColorSuccessTransparent = new StringBuffer();
  StringBuffer sinkColorInfoTransparent = new StringBuffer();
  StringBuffer sinkColorWarningTransparent = new StringBuffer();
  StringBuffer sinkColorDangerTransparent = new StringBuffer();
  StringBuffer colorPrimary = new StringBuffer();
  StringBuffer colorSuccess = new StringBuffer();
  StringBuffer colorInfo = new StringBuffer();
  StringBuffer colorWarning = new StringBuffer();
  StringBuffer colorDanger = new StringBuffer();
  StringBuffer colorPrimaryTransparent = new StringBuffer();
  StringBuffer colorSuccessTransparent = new StringBuffer();
  StringBuffer colorInfoTransparent = new StringBuffer();
  StringBuffer colorWarningTransparent = new StringBuffer();
  StringBuffer colorDangerTransparent = new StringBuffer();

  map.forEach((key, val) {
    List<String> indexColor = key.split("-");
    if (indexColor.length == 3) {
      //generate for non transparent color
      switch (indexColor[1]) {
        case 'primary':
          {
            sinkColorPrimary.write(
                indexColor[2] + ' :  Color(' + hexColorWithOpacity(val) + '),');
            sinkColorPrimary.write('\n      ');
            if (indexColor[2] == '500') {
              colorPrimary.write(hexColorWithOpacity(val));
            }
          }
          break;

        case 'success':
          {
            sinkColorSuccess.write(
                indexColor[2] + ' :  Color(' + hexColorWithOpacity(val) + '),');
            sinkColorSuccess.write('\n      ');
            if (indexColor[2] == '500') {
              colorSuccess.write(hexColorWithOpacity(val));
            }
          }
          break;

        case 'info':
          {
            sinkColorInfo.write(
                indexColor[2] + ' :  Color(' + hexColorWithOpacity(val) + '),');
            sinkColorInfo.write('\n      ');
            if (indexColor[2] == '500') {
              colorInfo.write(hexColorWithOpacity(val));
            }
          }
          break;
        case 'warning':
          {
            sinkColorWarning.write(
                indexColor[2] + ' :  Color(' + hexColorWithOpacity(val) + '),');
            sinkColorWarning.write('\n      ');
            if (indexColor[2] == '500') {
              colorWarning.write(hexColorWithOpacity(val));
            }
          }
          break;

        case 'danger':
          {
            sinkColorDanger.write(
                indexColor[2] + ' :  Color(' + hexColorWithOpacity(val) + '),');
            sinkColorDanger.write('\n      ');
            if (indexColor[2] == '500') {
              colorDanger.write(hexColorWithOpacity(val));
            }
          }

          break;
      }
    } else {
      //generate for transparent color
      String rgba = val.substring(6, val.length - 1);
      List<String> rgbaVal = rgba.split(",");

      switch (indexColor[1]) {
        case 'primary':
          {
            sinkColorPrimaryTransparent.write(indexColor[3] +
                ' :  Color(' +
                convertRgbaToHex(int.parse(rgbaVal[0]), int.parse(rgbaVal[1]),
                    int.parse(rgbaVal[2]), double.parse(rgbaVal[3])) +
                '),');
            sinkColorPrimaryTransparent.write('\n      ');
            if (indexColor[3] == '500') {
              colorPrimaryTransparent.write(convertRgbaToHex(
                  int.parse(rgbaVal[0]),
                  int.parse(rgbaVal[1]),
                  int.parse(rgbaVal[2]),
                  double.parse(rgbaVal[3])));
            }
          }
          break;

        case 'success':
          {
            sinkColorSuccessTransparent.write(indexColor[3] +
                ' :  Color(' +
                convertRgbaToHex(int.parse(rgbaVal[0]), int.parse(rgbaVal[1]),
                    int.parse(rgbaVal[2]), double.parse(rgbaVal[3])) +
                '),');
            sinkColorSuccessTransparent.write('\n      ');
            if (indexColor[3] == '500') {
              colorSuccessTransparent.write(convertRgbaToHex(
                  int.parse(rgbaVal[0]),
                  int.parse(rgbaVal[1]),
                  int.parse(rgbaVal[2]),
                  double.parse(rgbaVal[3])));
            }
          }
          break;

        case 'info':
          {
            sinkColorInfoTransparent.write(indexColor[3] +
                ' :  Color(' +
                convertRgbaToHex(int.parse(rgbaVal[0]), int.parse(rgbaVal[1]),
                    int.parse(rgbaVal[2]), double.parse(rgbaVal[3])) +
                '),');
            sinkColorInfoTransparent.write('\n      ');
            if (indexColor[3] == '500') {
              colorInfoTransparent.write(convertRgbaToHex(
                  int.parse(rgbaVal[0]),
                  int.parse(rgbaVal[1]),
                  int.parse(rgbaVal[2]),
                  double.parse(rgbaVal[3])));
            }
          }
          break;
        case 'warning':
          {
            sinkColorWarningTransparent.write(indexColor[3] +
                ' :  Color(' +
                convertRgbaToHex(int.parse(rgbaVal[0]), int.parse(rgbaVal[1]),
                    int.parse(rgbaVal[2]), double.parse(rgbaVal[3])) +
                '),');
            sinkColorWarningTransparent.write('\n      ');
            if (indexColor[3] == '500') {
              colorWarningTransparent.write(convertRgbaToHex(
                  int.parse(rgbaVal[0]),
                  int.parse(rgbaVal[1]),
                  int.parse(rgbaVal[2]),
                  double.parse(rgbaVal[3])));
            }
          }
          break;

        case 'danger':
          {
            sinkColorDangerTransparent.write(indexColor[3] +
                ' :  Color(' +
                convertRgbaToHex(int.parse(rgbaVal[0]), int.parse(rgbaVal[1]),
                    int.parse(rgbaVal[2]), double.parse(rgbaVal[3])) +
                '),');
            sinkColorDangerTransparent.write('\n      ');
            if (indexColor[3] == '500') {
              colorDangerTransparent.write(convertRgbaToHex(
                  int.parse(rgbaVal[0]),
                  int.parse(rgbaVal[1]),
                  int.parse(rgbaVal[2]),
                  double.parse(rgbaVal[3])));
            }
          }
          break;
      }
    }
  });

  String dist = format(
      tpl,
      sinkColorPrimary,
      sinkColorSuccess,
      sinkColorInfo,
      sinkColorWarning,
      sinkColorDanger,
      sinkColorPrimaryTransparent,
      sinkColorSuccessTransparent,
      sinkColorInfoTransparent,
      sinkColorWarningTransparent,
      sinkColorDangerTransparent,
      colorPrimary,
      colorSuccess,
      colorInfo,
      colorWarning,
      colorDanger,
      colorPrimaryTransparent,
      colorSuccessTransparent,
      colorInfoTransparent,
      colorWarningTransparent,
      colorDangerTransparent);

  ///generate file
  new File(output)
    ..createSync(recursive: true)
    ..writeAsStringSync(dist);
  return true;
}

///make format text for write to file
String format(
  String fmt,
  StringBuffer primary,
  StringBuffer success,
  StringBuffer info,
  StringBuffer warning,
  StringBuffer danger,
  StringBuffer primaryTransparent,
  StringBuffer successTransparent,
  StringBuffer infoTransparent,
  StringBuffer warningTransparent,
  StringBuffer dangerTransparent,
  StringBuffer primaryColor,
  StringBuffer successColor,
  StringBuffer infoColor,
  StringBuffer warningColor,
  StringBuffer dangerColor,
  StringBuffer primaryTransparentColor,
  StringBuffer successTransparentColor,
  StringBuffer infoTransparentColor,
  StringBuffer warningTransparentColor,
  StringBuffer dangerTransparentColor,
) {
  return fmt +
      '\n   static const TuxColor primary = TuxColor(' +
      primaryColor.toString() +
      ', {\n      ' +
      primary.toString() +
      '\n   });\n   static const TuxColor success = TuxColor(' +
      successColor.toString() +
      ', {\n      ' +
      success.toString() +
      '\n   });\n   static const TuxColor info = TuxColor(' +
      infoColor.toString() +
      ', {\n      ' +
      info.toString() +
      '\n   });\n   static const TuxColor warning = TuxColor(' +
      warningColor.toString() +
      ', {\n      ' +
      warning.toString() +
      '\n   });\n   static const TuxColor danger = TuxColor(' +
      dangerColor.toString() +
      ', {\n      ' +
      danger.toString() +
      '\n   });\n   static const TuxColor primaryTransparent = TuxColor(' +
      primaryTransparentColor.toString() +
      ', {\n      ' +
      primaryTransparent.toString() +
      '\n   });\n   static const TuxColor successTransparent = TuxColor(' +
      successTransparentColor.toString() +
      ', {\n      ' +
      successTransparent.toString() +
      '\n   });\n   static const TuxColor infoTransparent = TuxColor(' +
      infoTransparentColor.toString() +
      ', {\n      ' +
      infoTransparent.toString() +
      '\n   });\n   static const TuxColor warningTransparent = TuxColor(' +
      warningTransparentColor.toString() +
      ', {\n      ' +
      warningTransparent.toString() +
      '\n   });\n   static const TuxColor dangerTransparent = TuxColor(' +
      dangerTransparentColor.toString() +
      ', {\n      ' +
      dangerTransparent.toString() +
      '\n   });\n}';
}

///convert hex color with opacity
String hexColorWithOpacity(String color) {
  return color.replaceFirst("#", "0xFF");
}

///convert RGBA color to hex with opacity
int hexOfRGBA(int r, int g, int b, double opacity) {
  r = (r < 0) ? -r : r;
  g = (g < 0) ? -g : g;
  b = (b < 0) ? -b : b;
  opacity = (opacity < 0) ? -opacity : opacity;
  opacity = (opacity > 1) ? 255 : opacity * 255;
  r = (r > 255) ? 255 : r;
  g = (g > 255) ? 255 : g;
  b = (b > 255) ? 255 : b;
  int a = opacity.toInt();
  return int.parse(
      '0x${a.toRadixString(16)}${r.toRadixString(16)}${g.toRadixString(16)}${b.toRadixString(16)}');
}

String convertRgbaToHex(int r, int g, int b, double a) {
  int hexLong = hexOfRGBA(r, g, b, a);
  String hex = "0x${hexLong.toRadixString(16)}";
  return hex;
}
