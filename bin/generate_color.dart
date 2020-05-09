import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:mime/mime.dart';

const tpl =
    "import 'dart:ui';\nimport 'package:glukutux/glukutux.dart';\n\n\n//@autogenerate do not edit\nclass TuxColorScheme {";

void main(List<String> args) {
  String src;
  String dist;

  var parser = new ArgParser();
  parser.addOption('src', abbr: 'i', defaultsTo: './json_data/data.json',
      callback: (value) {
    return src = value;
  }, help: "Specify the json directory.");
  parser.addOption('dist',
      abbr: 'o',
      defaultsTo: 'lib/color/tux_color.dart', callback: (value) {
    return dist = value;
  }, help: "Specify the dist directory.");
  parser.parse(args);

  var inputFile = new File(src);

  if (inputFile.existsSync()) {
    if (checkingFileJson(src)) {
      if (checkingFileDart(dist)) {
        generateFile(inputFile, dist);
      } else {
        print('output file type must be dart!');
      }
    } else {
      print('input file type must be json!');
    }
  } else {
    print('File is not exist!' + inputFile.existsSync().toString());
  }
}

///validate input is json file
bool checkingFileJson(String path) {
  String mimeStr = lookupMimeType(path);
  var fileType = mimeStr.split('/');
  if (fileType.last == 'json') {
    return true;
  } else {
    return false;
  }
}

///validate output is dart file
bool checkingFileDart(String path) {
  String mimeStr = lookupMimeType(path);
  var fileType = mimeStr.split('/');
  if (fileType.last == 'x-dart') {
    return true;
  } else {
    return false;
  }
}

void generateFile(File file, String outputPath) async {
  File files = file;
  String output = outputPath;
  var map = json.decode(files.readAsStringSync());

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

  (map as Map<String, dynamic>).forEach((key, val) {
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

  var dist = format(
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
  print('generate file complete');
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
