import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardAccount extends StatelessWidget {
  final void Function()? onPress;
  final IconData? icon;
  final String title;
  final double width;
  final double height;
  final Color backgroundColor;
  const CardAccount(
      {super.key,
      this.onPress,
      this.icon,
      required this.title,
      this.width = 100,
      this.height = 100,
      this.backgroundColor = Colors.green});

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: backgroundColor),
      child: (InkWell(
        onTap: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            CustomText(
              title: title,
              textColor: Colors.white,
            )
          ],
        ),
      )),
    );
  }
}
