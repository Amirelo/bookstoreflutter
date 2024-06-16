import 'package:bookstore/src/models/cart_model.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardCart extends StatelessWidget {
  final CartModel cart;
  const CardCart({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double price = 100000;
    return (Container(
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      width: 340,
      height: 150,
      child: Row(
        children: [
          CustomImage(
            imageLink:
                "https://images.pexels.com/photos/7408586/pexels-photo-7408586.jpeg",
            width: 140,
            height: const BoxConstraints().maxHeight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(title: "Title"),
              CustomText(title: "Description"),
              CustomText(title: "Price: $price"),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {},
                  ),
                  CustomText(title: "1"),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
              CustomText(title: "Total:")
            ],
          )
        ],
      ),
    ));
  }
}
