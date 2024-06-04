import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(children: [
        Image.network(
            "https://images.pexels.com/photos/16446088/pexels-photo-16446088/free-photo-of-colorful-cloths-over-house-door.jpeg"),
        Text("Products")
      ]),
    ));
  }
}
