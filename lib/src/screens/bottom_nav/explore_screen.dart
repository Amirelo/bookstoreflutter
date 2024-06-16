import 'dart:math';

import 'package:bookstore/src/models/book_model.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:bookstore/src/widgets/product/card_product.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<BookModel> bookList = List.generate(
        30,
        (index) => BookModel(
            index.toString(),
            "Test book $index",
            Random().nextInt(50000),
            "Author $index",
            "A test description for test book $index",
            "https://images.pexels.com/photos/16446088/pexels-photo-16446088/free-photo-of-colorful-cloths-over-house-door.jpeg"));
    TextEditingController searchController = TextEditingController();
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Column(children: [
        CustomInput(
          hint: "Search",
          controller: searchController,
          inputBorder: const OutlineInputBorder(),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.filter)),
                Text("Filter"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.sort)),
                Text("Sort"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.grid_view)),
                Text("View"),
              ],
            ),
          ],
        ),
        SizedBox(
          // Books
          height: 347,
          width: const BoxConstraints().maxWidth,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 20),
            scrollDirection: Axis.horizontal,
            itemCount: bookList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CardProduct(bookModel: bookList[index]);
            },
          ),
        )
      ]),
    ));
  }
}
