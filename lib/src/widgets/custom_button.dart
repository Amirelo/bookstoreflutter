import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double paddingTop;
  final double paddingBottom;
  final Function()? onPress;
  const CustomButton(
      {super.key,
      required this.title,
      this.width = 0,
      this.paddingTop = 0,
      this.paddingBottom = 0,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
      child: SizedBox(
        width: width == 0 ? const BoxConstraints().maxWidth : width,
        height: width == 0 ? 48 : 40,
        child: (ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
          onPressed: onPress,
          child: CustomText(
            title: title,
            fontPreset: FontPresets.normalBold,
          ),
        )),
      ),
    );
  }
}
