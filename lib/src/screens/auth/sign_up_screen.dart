import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: const CustomText(
            title: "Sign Up",
            fontPreset: FontPresets.header,
          ),
        ),
        body: SafeArea(
          child: Container(
            width: const BoxConstraints().maxWidth,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(children: [
              const CustomText(
                title: "Create new account",
                paddingBottom: 20,
              ),
              CustomInput(
                hint: "Email",
                controller: emailController,
                paddingBottom: 12,
              ),
              CustomInput(
                hint: "Password",
                controller: passwordController,
                hasObscure: true,
                paddingBottom: 12,
              ),
              CustomInput(
                hint: "Confirm Password",
                controller: confPasswordController,
                hasObscure: true,
                paddingBottom: 20,
              ),
              ButtonTextCustom(onPress: onSignUpPress, title: "Sign Up")
            ]),
          ),
        )));
  }
}
