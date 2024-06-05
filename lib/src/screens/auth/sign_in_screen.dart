import 'package:bookstore/src/screens/auth/sign_up_screen.dart';
import 'package:bookstore/src/screens/home/main_screen.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showPassword = false;
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
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            const CustomText(
              title: "Sign In",
              paddingTop: 40,
              fontPreset: FontPresets.header,
            ),
            const CustomText(
              title: "Welcome to book store",
              paddingTop: 12,
              fontPreset: FontPresets.subTitle,
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: onVisibilityPress,
                  )),
              obscureText: showPassword,
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
      ),
    ));
  }
}
