import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageLink;
  final double? width;
  final double? height;

  const CustomImage(
      {super.key, required this.imageLink, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: (Image.network(
        imageLink,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(),
              ),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Colors.amber,
              ));
        },
      )),
    );
  }
}
