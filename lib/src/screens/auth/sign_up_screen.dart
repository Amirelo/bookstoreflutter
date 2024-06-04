import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();
  bool isEmailValid = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  onSignUpPress() {
    if (emailController.text != '') {
      isEmailValid = true;
      Navigator.pop(context);
    } else {
      isEmailValid = false;
    }
    print("Email validation status: $isEmailValid");
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: SafeArea(
      child: Column(children: [
        const Text("Sign Up"),
        const Text("Create new account"),
        TextField(
          decoration: const InputDecoration(hintText: "Email"),
          controller: emailController,
        ),
        TextField(
          decoration: const InputDecoration(hintText: "Password"),
          controller: passwordController,
        ),
        TextField(
          decoration: const InputDecoration(hintText: "Confirm Password"),
          controller: confPasswordController,
        ),
        const ColoredBox(
          color: Colors.greenAccent,
          child: SizedBox(
            width: 20,
            height: 14,
          ),
        ),
        const ColoredBox(
          color: Colors.greenAccent,
          child: SizedBox(
            width: 20,
            height: 14,
          ),
        ),
        const ColoredBox(
          color: Colors.greenAccent,
          child: SizedBox(
            width: 20,
            height: 14,
          ),
        ),
        TextButton(onPressed: onSignUpPress, child: const Text("Sign Up"))
      ]),
    )));
  }
}
