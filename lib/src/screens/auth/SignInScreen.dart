import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text("Sign In"),
        const Text("Welcome to book store"),
        const TextField(
          decoration: InputDecoration(hintText: "Username"),
        ),
        const TextField(
          decoration: InputDecoration(hintText: "Password"),
        ),
        TextButton(onPressed: () {}, child: const Text("Sign In")),
        const Text("Or sign in with"),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text("Google")),
            TextButton(onPressed: () {}, child: const Text("Facebook")),
            TextButton(onPressed: () {}, child: const Text("Apple")),
          ],
        ),
        const Text("Don't have an account? Sign up here"),
      ],
    ));
  }
}
