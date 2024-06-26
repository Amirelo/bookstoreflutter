import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardEBook extends StatelessWidget {
  final Function()? onPress;
  const CardEBook({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: 350,
      height: 200,
      color: Colors.green,
      child: Row(
        children: [
          CustomImage(
            imageLink:
                "https://images.pexels.com/photos/25677016/pexels-photo-25677016/free-photo-of-g-phong-c-nh-chim-kho.jpeg",
            width: 100,
            height: 140,
          ),
          Column(
            children: [
              CustomText(title: "Book title"),
              CustomText(title: "Description"),
              CustomText(title: "Progress"),
              ButtonTextCustom(
                title: "Read now",
                onPress: onPress,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
