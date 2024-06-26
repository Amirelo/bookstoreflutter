import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String verificationCode = "";
  bool allowPasswordChange = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController verificationController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfController = TextEditingController();
    void onSendVerificationPress() {
      setState(() {
        verificationCode = "fomes";
      });
    }

    void onVerifyPress() {
      if (verificationCode == verificationController.text) {
        setState(() {
          allowPasswordChange = true;
        });
      }
    }

    return (Scaffold(
      appBar: AppBar(
          title: const CustomText(
              title: "Forgot Password", fontPreset: FontPresets.header)),
      body: SafeArea(
        child: Container(
            width: const BoxConstraints().maxWidth,
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: allowPasswordChange
                ? Column(
                    children: [
                      CustomInput(
                        hint: "New Password",
                        controller: passwordController,
                        paddingBottom: 12,
                        hasObscure: true,
                      ),
                      CustomInput(
                        hint: "Confirm New Password",
                        controller: passwordConfController,
                        paddingBottom: 20,
                        hasObscure: true,
                      ),
                      ButtonTextCustom(
                        title: "Send Verification Code",
                        onPress: onSendVerificationPress,
                      )
                    ],
                  )
                : verificationCode == ""
                    ? Column(
                        children: [
                          CustomInput(
                            hint: "Email",
                            controller: emailController,
                            paddingBottom: 20,
                          ),
                          ButtonTextCustom(
                            title: "Send Verification Code",
                            onPress: onSendVerificationPress,
                          )
                        ],
                      )
                    : Column(
                        children: [
                          CustomInput(
                            hint: "Verification code",
                            controller: verificationController,
                            paddingBottom: 20,
                          ),
                          ButtonTextCustom(
                            title: "Verify",
                            onPress: onVerifyPress,
                          )
                        ],
                      )),
      ),
    ));
  }
}
