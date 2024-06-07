import 'package:bookstore/src/models/book_model.dart';
import 'package:bookstore/src/widgets/custom_button.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:bookstore/src/widgets/product/card_product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Container(
        width: const BoxConstraints().maxWidth,
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Image.network(
                "https://images.pexels.com/photos/16446088/pexels-photo-16446088/free-photo-of-colorful-cloths-over-house-door.jpeg",
                width: const BoxConstraints().maxWidth,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const CircularProgressIndicator();
            }),
          ),
          const Wrap(
            spacing: 20,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.circle,
                size: 16,
              ),
              Icon(Icons.circle, size: 10),
              Icon(Icons.circle, size: 10),
            ],
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: CustomText(
              title: "Products",
              fontPreset: FontPresets.title,
            ),
          ),
          const CardProduct(
            bookModel: BookModel(
                "1",
                "Test book",
                200000,
                "Tier",
                "A test description",
                "https://images.pexels.com/photos/733854/pexels-photo-733854.jpeg"),
          )
        ]),
      ),
    ));
  }
}
