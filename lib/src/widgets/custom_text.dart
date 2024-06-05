import 'package:flutter/material.dart';

enum FontPresets {
  small,
  normal,
  normalBold,
  subTitle,
  title,
  subHeader,
  header
}

class CustomText extends StatelessWidget {
  final String title;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final double padding;
  final FontPresets fontPreset;

  const CustomText(
      {super.key,
      required this.title,
      this.padding = 0,
      this.paddingTop = 0,
      this.paddingBottom = 0,
      this.paddingLeft = 0,
      this.paddingRight = 0,
      this.fontPreset = FontPresets.normal});

  @override
  Widget build(BuildContext context) {
    double fontSize;
    FontWeight fontWeight;
    switch (fontPreset) {
      case FontPresets.small:
        fontSize = 12;
        fontWeight = FontWeight.normal;
        break;
      case FontPresets.normalBold:
        fontSize = 14;
        fontWeight = FontWeight.bold;
        break;
      case FontPresets.subTitle:
        fontSize = 16;
        fontWeight = FontWeight.normal;
        break;
      case FontPresets.title:
        fontSize = 18;
        fontWeight = FontWeight.bold;
        break;
      case FontPresets.subHeader:
        fontSize = 20;
        fontWeight = FontWeight.bold;
        break;
      case FontPresets.header:
        fontSize = 24;
        fontWeight = FontWeight.bold;
        break;
      default:
        fontSize = 14;
        fontWeight = FontWeight.normal;
        break;
    }

    return Padding(
        padding: EdgeInsets.only(
            top: paddingTop != 0 ? paddingTop : padding,
            bottom: paddingBottom != 0 ? paddingBottom : padding,
            left: paddingLeft != 0 ? paddingLeft : padding,
            right: paddingRight != 0 ? paddingRight : padding),
        child: (Text(
          title,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        )));
  }
}
