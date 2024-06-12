import 'package:bookstore/src/models/book_model.dart';
import 'package:bookstore/src/screens/auth/forgot_password_screen.dart';
import 'package:bookstore/src/screens/auth/sign_up_screen.dart';
import 'package:bookstore/src/screens/home/main_screen.dart';
import 'package:bookstore/src/widgets/custom_button.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onSignUpPress() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
    }

    void onForgotPasswordPress() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ForgotPasswordScreen()));
    }

    void onSignInPress() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Welcome back"),
        action: SnackBarAction(
          label: "Dismiss",
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
    }

    return Scaffold(
        body: SafeArea(
      child: Container(
        width: const BoxConstraints().maxWidth,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
        child: Column(
          children: [
            const CustomText(
              title: "Sign In",
              paddingBottom: 8,
              fontPreset: FontPresets.header,
            ),
            const CustomText(
              title: "Welcome to book store",
              paddingBottom: 20,
              fontPreset: FontPresets.subTitle,
            ),
            CustomInput(
              hint: "Username",
              controller: usernameController,
              paddingBottom: 12,
            ),
            CustomInput(
              hint: "Password",
              controller: passwordController,
              paddingBottom: 20,
              hasObscure: true,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(children: [
                const Spacer(),
                TextButton(
                  onPressed: onForgotPasswordPress,
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerRight,
                  ),
                  child: const Text(
                    "Forgot password",
                  ),
                ),
              ]),
            ),
            CustomButton(
              title: "Sign In",
              paddingBottom: 20,
              onPress: onSignInPress,
            ),
            const CustomText(
              title: "Or sign in with",
              paddingBottom: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: "Google",
                  width: 110,
                  onPress: () {},
                ),
                CustomButton(
                  title: "Facebook",
                  width: 110,
                  onPress: () {},
                ),
                CustomButton(
                  title: "Apple",
                  width: 110,
                  onPress: () {},
                ),
              ],
            ),
            const Spacer(),
            TextButton(
                onPressed: onSignUpPress,
                child: const Text("Don't have an account? Sign up here")),
          ],
        ),
      ),
    ));
  }
}
