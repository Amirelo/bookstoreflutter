import 'package:bookstore/src/models/book_model.dart';
import 'package:bookstore/src/models/category_model.dart';
import 'package:bookstore/src/providers/category_provider.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:bookstore/src/widgets/product/card_product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categoryList = List.empty();

  void getData() async {
    debugPrint("----Getting data");
    try {
      List<CategoryModel> data = await getCategories();
      debugPrint("-----data: $categoryList");
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
    const BookModel book1 = BookModel(
        "1",
        "Test book 1",
        5000,
        "Collins",
        "This is a test",
        "https://images.pexels.com/photos/16446088/pexels-photo-16446088/free-photo-of-colorful-cloths-over-house-door.jpeg");
    const BookModel book2 = BookModel(
        "2",
        "Test book 2",
        8000,
        "Collins",
        "This is a test",
        "https://images.pexels.com/photos/16446088/pexels-photo-16446088/free-photo-of-colorful-cloths-over-house-door.jpeg");
    const BookModel book3 = BookModel(
        "3",
        "Test book 3",
        53788,
        "Collins",
        "This is a test",
        "https://images.pexels.com/photos/16446088/pexels-photo-16446088/free-photo-of-colorful-cloths-over-house-door.jpeg");
    List<BookModel> bookList = <BookModel>[book1, book2, book3];
    bookList.add(book1);
    return (Scaffold(
      body: Container(
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
            height: 200,
            child: ListView.builder(
              itemCount: categoryList.length,
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 40,
                color: Colors.green,
                child: CustomText(
                  title: categoryList[index].name,
                  fontPreset: FontPresets.title,
                ),
              ),
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
                return CardProduct(bookModel: bookList[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 12,
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
