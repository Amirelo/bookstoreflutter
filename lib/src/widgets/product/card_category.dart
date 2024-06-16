import 'package:bookstore/src/models/category_model.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CardCategory extends StatefulWidget {
  final CategoryModel category;
  const CardCategory({super.key, required this.category});

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory>
    with TickerProviderStateMixin {
  late final AnimationController animController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 50));

  @override
  Widget build(BuildContext context) {
    return (InkWell(
      onTap: () {},
      onLongPress: () {
        animController.forward();
      },
      onHover: (isHovering) {
        if (isHovering) {
          animController.forward();
        } else {
          animController.reverse();
        }
      },
      child: Column(children: [
        Stack(
          children: [
// Image
            AnimatedBuilder(
              animation: animController,
              builder: (_, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(2, 2, 0.001)
                    ..rotateY(animController.value * math.pi / 2),
                  alignment: Alignment.center,
                  child: child,
                );
              },
              child: CustomImage(
                imageLink: widget.category.image,
                width: 200,
                height: 300,
              ),
            ),
// Description
            AnimatedBuilder(
              animation: animController,
              builder: (_, child) {
                return Positioned(
                  top: 0,
                  child: Transform(
                    transform: Matrix4.rotationY(math.pi / 4)
                      ..setEntry(2, 2, 0.001)
                      ..rotateY((1 - animController.value) * math.pi / 4),
                    alignment: Alignment.center,
                    child: child,
                  ),
                );
              },
              child: Positioned(
                top: 0,
                child: SizedBox(
                  width: 200,
                  height: 300,
                  child: CustomText(
                    title: widget.category.description,
                  ),
                ),
              ),
            ),
          ],
        ),
        CustomText(
          title: widget.category.name,
          fontPreset: FontPresets.title,
        ),
      ]),
    ));
  }
}
