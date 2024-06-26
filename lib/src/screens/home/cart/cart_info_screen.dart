import 'package:bookstore/src/screens/home/cart/cart_payment_screen.dart';
import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class CartInfoScreen extends StatelessWidget {
  const CartInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onContinuePress() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CartPaymentScreen()));
    }

    return (Scaffold(
        body: Column(
      children: [
        CustomInput(hint: "Address", controller: TextEditingController()),
        ButtonTextCustom(
          title: "Continue",
          onPress: onContinuePress,
        )
      ],
    )));
  }
}
