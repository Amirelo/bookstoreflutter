import 'package:bookstore/src/screens/auth/services/auth_service.dart';
import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:bookstore/src/widgets/popup_message.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String emailReg = r'[a-zA-Z0-9]+@+[a-zA-Z0-9]+\.+[a-zA-Z0-9]';

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    void onSendVerificationPress() async {
      if (emailController.text.isNotEmpty) {
        if (RegExp(emailReg).hasMatch(emailController.text)) {
          if (await emailExisted(emailController.text)) {
            // Send Email
            bool result = await sendPasswordChangeEmail(emailController.text);
            if (result && context.mounted) {
              popupMessage("A password change link has been sent to your email",
                  context);
              Navigator.pop(context);
            } else {
              if (context.mounted) {
                popupMessage("Fail to send password change link", context);
              }
            }
          } else {
            if (context.mounted) {
              popupMessage("No account associate with provided email", context);
            }
          }
        } else {
          popupMessage("Bad email format", context);
        }
      } else {
        popupMessage("Fields cannot be empty", context);
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
              child: Column(
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
              ))),
    ));
  }
}
