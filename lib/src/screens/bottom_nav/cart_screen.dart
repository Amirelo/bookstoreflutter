import 'package:bookstore/src/widgets/custom_button.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Container(
      width: const BoxConstraints().maxWidth,
      height: 200,
      child: Row(
        children: [
          CustomImage(
            imageLink:
                "https://images.pexels.com/photos/25469922/pexels-photo-25469922/free-photo-of-a-room-with-a-rug-and-a-window.jpeg",
            width: 140,
            height: 200,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(title: "The broken one"),
              CustomText(title: "Description"),
              Row(
                children: [
                  CustomButton(
                    title: "-",
                    width: 50,
                  ),
                  CustomText(title: "1"),
                  CustomButton(
                    title: "+",
                    width: 50,
                  )
                ],
              )
            ],
          )
        ],
      ),
    )));
  }
}
