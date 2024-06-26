import 'package:bookstore/src/models/book_model.dart';
import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final BookModel bookModel;
  final Function()? onPress;
  const CardProduct({super.key, required this.bookModel, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 225, 225, 225),
          borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onPress,
        child: (
            // Products
            Container(
          width: 200,
          padding: const EdgeInsets.all(8),
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
            ],
          ),
        )),
      ),
    );
  }
}
