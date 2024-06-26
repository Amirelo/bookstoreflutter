import 'package:bookstore/src/screens/home/bottom_nav/home_screen.dart';
import 'package:bookstore/src/screens/home/main_screen.dart';
import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CartPaymentScreen extends StatelessWidget {
  const CartPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onOrderPress() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Order completed"),
        action: SnackBarAction(
          label: "Dismiss",
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
    }

    return (Scaffold(
        body: Column(
      children: [
        CustomInput(hint: "Coupon", controller: TextEditingController()),
        ButtonTextCustom(
          title: "Order",
          onPress: onOrderPress,
        )
      ],
    )));
  }
}
