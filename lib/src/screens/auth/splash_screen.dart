import 'package:bookstore/src/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SplashSCreen extends StatelessWidget {
  const SplashSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    onContinuePressed() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()));
    }

    return (Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green, Colors.blue],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(
          children: [
            Image.network(
                "https://images.pexels.com/photos/762687/pexels-photo-762687.jpeg"),
            const Text("Title"),
            const Text("Description"),
            TextButton(
                onPressed: onContinuePressed, child: const Text("Continue")),
          ],
        ),
      ),
    ));
  }
}
