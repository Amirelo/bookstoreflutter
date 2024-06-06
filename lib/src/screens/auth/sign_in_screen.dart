import 'package:bookstore/src/screens/auth/sign_up_screen.dart';
import 'package:bookstore/src/screens/home/main_screen.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showPassword = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onSignUpPress() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
    }

    void onSignInPress() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
    }

    void onVisibilityPress() {
      setState(() {
        showPassword = !showPassword;
      });
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
            SizedBox(
              width: BoxConstraints().maxWidth,
              height: 48,
              child: ElevatedButton(
                onPressed: onSignInPress,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text("Sign In"),
              ),
            ),
            const Text("Or sign in with"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(
                            const BoxConstraints().maxWidth * 0.3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text("Google")),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(
                            const BoxConstraints().maxWidth * 0.3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text("Facebook")),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Apple"),
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size.fromWidth(BoxConstraints().maxWidth * 0.3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
              ],
            ),
            TextButton(
                onPressed: onSignUpPress,
                child: const Text("Don't have an account? Sign up here")),
          ],
        ),
      ),
    ));
  }
}
