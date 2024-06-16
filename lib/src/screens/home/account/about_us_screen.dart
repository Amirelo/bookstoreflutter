import 'package:bookstore/src/widgets/custom_button.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Column(
      children: [
        CustomImage(
            width: 200,
            height: 200,
            imageLink:
                "https://images.pexels.com/photos/13862436/pexels-photo-13862436.png"),
        CustomButton(title: "Username"),
        CustomButton(title: "Email"),
        CustomButton(title: "Change Password"),
        CustomButton(title: "Recenly Viewed"),
        CustomButton(title: "Deactivate account"),
        CustomButton(title: "Transfer account"),
      ],
    )));
  }
}
