import 'package:bookstore/src/screens/auth/forgot_password_screen.dart';
import 'package:bookstore/src/screens/auth/sign_up_screen.dart';
import 'package:bookstore/src/screens/home/main_screen.dart';
import 'package:bookstore/src/widgets/button/button_text_custom.dart';
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
        content: const Text("Welcome back"),
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

    void onGooglePress() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Google Sign In"),
        action: SnackBarAction(
            label: "Dismiss",
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
      ));
    }

    void onFacebookPress() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Facebook Sign In"),
          action: SnackBarAction(
              label: "Dismiss",
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              })));
    }

    void onApplePress() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Apple Sign In"),
        action: SnackBarAction(
            label: "Dismiss",
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
      ));
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
            ButtonTextCustom(
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
                ButtonTextCustom(
                  title: "Google",
                  width: 110,
                  onPress: onGooglePress,
                ),
                ButtonTextCustom(
                  title: "Facebook",
                  width: 110,
                  onPress: onFacebookPress,
                ),
                ButtonTextCustom(
                  title: "Apple",
                  width: 110,
                  onPress: onApplePress,
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
