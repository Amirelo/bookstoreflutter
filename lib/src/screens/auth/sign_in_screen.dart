import 'package:bookstore/src/screens/auth/sign_up_screen.dart';
import 'package:bookstore/src/screens/home/main_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    onSignUpPress() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
    }

    onSignInPress() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
    }

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Text("Sign In"),
          const Text("Welcome to book store"),
          const TextField(
            decoration: InputDecoration(hintText: "Username"),
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Password"),
          ),
          TextButton(onPressed: onSignInPress, child: const Text("Sign In")),
          const Text("Or sign in with"),
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text("Google")),
              TextButton(onPressed: () {}, child: const Text("Facebook")),
              TextButton(onPressed: () {}, child: const Text("Apple")),
            ],
          ),
          TextButton(
              onPressed: onSignUpPress,
              child: const Text("Don't have an account? Sign up here")),
        ],
      ),
    ));
  }
}