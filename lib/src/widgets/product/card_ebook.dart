import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardEBook extends StatelessWidget {
  const CardEBook({super.key});

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
            ],
          )
        ],
      ),
    ));
  }
}
