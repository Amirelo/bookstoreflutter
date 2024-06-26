import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        ButtonTextCustom(title: "Username"),
        ButtonTextCustom(title: "Email"),
        ButtonTextCustom(title: "Change Password"),
        ButtonTextCustom(title: "Recenly Viewed"),
        ButtonTextCustom(title: "Deactivate account"),
        ButtonTextCustom(title: "Transfer account"),
      ],
    )));
  }
}
