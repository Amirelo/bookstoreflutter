import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Column(
      children: [
        CustomText(title: "Language"),
        CustomText(title: "Theme"),
      ],
    )));
  }
}
