import 'package:bookstore/src/models/book_model.dart';
import 'package:bookstore/src/widgets/custom_button.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final BookModel bookModel;
  const CardProduct({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return (
        // Products
        Container(
      width: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            imageLink: bookModel.imageLink,
            height: 160,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                title: bookModel.name,
                fontPreset: FontPresets.title,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ))
            ],
          ),
          CustomText(
            title: bookModel.price.toString(),
            textColor: Colors.red,
            fontPreset: FontPresets.subTitleBold,
          ),
          CustomText(title: "Author: ${bookModel.author}"),
          CustomText(title: bookModel.description),
          CustomButton(
            title: "Add to cart",
            onPress: () {},
          )
        ],
      ),
    ));
  }
}
