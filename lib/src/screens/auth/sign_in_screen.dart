import 'package:bookstore/src/screens/auth/forgot_password_screen.dart';
import 'package:bookstore/src/screens/auth/services/auth_service.dart';
import 'package:bookstore/src/screens/auth/sign_up_screen.dart';
import 'package:bookstore/src/screens/home/main_screen.dart';
import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:bookstore/src/widgets/popup_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String emailErr = "";
    String passwordErr = "";

    bool checkFields() {
      var status = true;
      debugPrint("-------- email:${emailController.text}");
      debugPrint("-------- Password: ${passwordController.text}");

      if (emailController.text == "") {
        status = false;
        setState(() {
          status = false;
          emailErr = "Field cannot be empty";
        });
      } else {
        setState(() {
          emailErr = "";
        });
      }
      if (passwordController.text == "") {
        setState(() {
          status = false;
          passwordErr = "Fields cannot be empty";
        });
      } else {
        setState(() {
          passwordErr = "";
        });
      }
      // debugPrint("-------- emailErr:${emailErr}");
      // debugPrint("-------- passwordErr: ${passwordErr}");
      return status;
    }

    void loginUserWithPassword() async {
      UserCredential? res = await loginWithPasswordService(
          emailController.text, passwordController.text, context);
      if (res != null && context.mounted) {
        debugPrint("------result: $res");
        popupMessage("Welcome back ${res.user!.email}", context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MainScreen()));
      }
    }

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
      if (checkFields()) {
        loginUserWithPassword();
      } else {
        popupMessage("Fields cannot be empty", context);
      }
    }

    void onGooglePress() async {
      try {
        UserCredential res = await loginWithGoogle();
        if (context.mounted) {
          popupMessage("Welcome back ${res.user!.displayName}", context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      } catch (error) {
        debugPrint("-----Error signing in with google: $error");
      }
    }

    void onFacebookPress() async {
      var res = await loginWithFacebook();
      if (context.mounted && res != null) {
        popupMessage("Welcome back ${res.user!.displayName}", context);
      }
    }

    void onApplePress() {
      popupMessage("Apple Sign In", context);
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
              hint: "email",
              controller: emailController,
              paddingBottom: 12,
              errorMsg: emailErr,
            ),
            CustomInput(
              hint: "Password",
              controller: passwordController,
              paddingBottom: 20,
              hasObscure: true,
              errorMsg: passwordErr,
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
