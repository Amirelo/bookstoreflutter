import 'package:bookstore/src/screens/auth/services/auth_service.dart';
import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:bookstore/src/widgets/popup_message.dart';
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

  onCheckEmailPress() async {
    if (checkEmailFormat(emailController.text)) {
      bool result = await emailExisted(emailController.text);
      if (context.mounted) {
        if (!result) {
          setState(() {
            isEmailValid = true;
          });
        } else {
          popupMessage("An account is already using this email", context);
        }
      }
      debugPrint("------Email result: $result");
    }
  }

  checkEmailFormat(text) {
    bool isValid = true;

    if (text == "") {
      popupMessage("Fields cannot be empty", context);
      isValid = false;
    } else {
      const regex = r'^[a-zA-Z0-9]+@+[a-zA-Z0-9]+\.+[a-zA-Z]';
      isValid = RegExp(regex).hasMatch(text);
      if (isValid == false) {
        popupMessage("Email format error", context);
      }
    }
    debugPrint("------Status: $isValid");
    return isValid;
  }

  onSignUpPress() async {
    var pass = passwordController.text;
    var confPass = confPasswordController.text;

    if (pass.isEmpty) {
      popupMessage("Fields cannot be empty", context);
    }
    if (confPass.isEmpty) {
      popupMessage("Fields cannot be empty", context);
    } else if (pass != confPass) {
      popupMessage("Passwords doesn't match", context);
    } else {
      var res = await signUpWithPassword(
          emailController.text, passwordController.text);

      if (res != null && context.mounted) {
        popupMessage("Register successful", context);
        Navigator.pop(context);
      } else {
        debugPrint("Error: $res");
      }
    }
  }

  onChangeEmailPress() {
    setState(() {
      isEmailValid = false;
    });
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
            child: !isEmailValid
                ? Column(children: [
                    const CustomText(
                      title: "Verify email",
                      paddingBottom: 20,
                    ),
                    CustomInput(
                      hint: "Email",
                      controller: emailController,
                      paddingBottom: 20,
                    ),
                    ButtonTextCustom(
                        onPress: onCheckEmailPress, title: "Check Email")
                  ])
                : Column(children: [
                    const CustomText(
                      title: "Create new account",
                      paddingBottom: 20,
                    ),
                    CustomText(title: "Email: ${emailController.text}"),
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
                    ButtonTextCustom(
                      onPress: onSignUpPress,
                      title: "Sign Up",
                      paddingBottom: 20,
                    ),
                    ButtonTextCustom(
                      title: "Change Email",
                      width: 200,
                      onPress: onChangeEmailPress,
                    )
                  ]),
          ),
        )));
  }
}
