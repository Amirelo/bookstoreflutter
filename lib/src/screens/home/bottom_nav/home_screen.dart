import 'package:bookstore/src/models/book_model.dart';
import 'package:bookstore/src/models/category_model.dart';
import 'package:bookstore/src/providers/category_provider.dart';
import 'package:bookstore/src/screens/home/bottom_nav/explore_screen.dart';
import 'package:bookstore/src/screens/home/product/product_detail_screen.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:bookstore/src/widgets/product/card_category.dart';
import 'package:bookstore/src/widgets/product/card_product.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  final Function() onCategoryPress;
  const HomeScreen({super.key, required this.onCategoryPress});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<CategoryModel> categoryList = List.empty();

  void getData() async {
    debugPrint("----Getting data");
    try {
      List<CategoryModel> data = await getCategories();
      debugPrint("-----categories: $categoryList");
      setState(() {
        categoryList = data;
      });
    } on Exception catch (error) {
      debugPrint("----Fail to get data: $error");
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onProductPress() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
    }

    List<BookModel> bookList = List.generate(
        3,
        (index) => BookModel(
            index.toString(),
            "Test book $index",
            math.Random().nextInt(200000) + 50000,
            "Author $index",
            "This is a test #$index",
            "https://images.pexels.com/photos/16446088/pexels-photo-16446088/free-photo-of-colorful-cloths-over-house-door.jpeg"));

    return (Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: const BoxConstraints().maxWidth,
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: Column(children: [
            CustomImage(
              imageLink:
                  "https://images.pexels.com/photos/16446088/pexels-photo-16446088/free-photo-of-colorful-cloths-over-house-door.jpeg",
              width: const BoxConstraints().maxWidth,
              height: 200,
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
                title: "Categories",
                paddingBottom: 8,
                fontPreset: FontPresets.title,
              ),
            ),
            SizedBox(
              width: const BoxConstraints().maxWidth,
              height: 350,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length > 5 ? 5 : categoryList.length,
                separatorBuilder: (builder, index) => const SizedBox(width: 40),
                itemBuilder: (context, index) => SizedBox(
                    child: CardCategory(
                  onPress: widget.onCategoryPress,
                  category: categoryList[index],
                )),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                title: "Bestsellers",
                paddingBottom: 8,
                fontPreset: FontPresets.title,
              ),
            ),
            SizedBox(
              width: const BoxConstraints().maxWidth,
              height: 340,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: bookList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardProduct(
                    bookModel: bookList[index],
                    onPress: onProductPress,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 12,
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
