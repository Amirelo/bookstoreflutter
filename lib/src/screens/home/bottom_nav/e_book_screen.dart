import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:bookstore/src/widgets/product/card_ebook.dart';
import 'package:flutter/material.dart';

class EBookScreen extends StatelessWidget {
  const EBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(body: CardEBook()));
  }
}
