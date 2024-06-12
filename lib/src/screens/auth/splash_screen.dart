import 'dart:async';

import 'package:bookstore/src/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SplashSCreen extends StatelessWidget {
  const SplashSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()));
    });

    return (Scaffold(
      body: Container(
        width: const BoxConstraints().maxWidth,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFFF99A2),
          Color(0xFFE406B5),
          Color(0xFF35088A)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Book Haven",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "Today a reader, tomorrow a leader.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    ));
  }
}
