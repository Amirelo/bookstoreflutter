// ignore_for_file: prefer_const_constructors

import 'package:bookstore/src/models/cart_model.dart';
import 'package:bookstore/src/screens/home/cart/cart_info_screen.dart';
import 'package:bookstore/src/widgets/button/button_text_custom.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:bookstore/src/widgets/product/card_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    void onContinuePress() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CartInfoScreen()));
    }

    CartModel cart = CartModel("1", "1", "1", 4);
    return (Scaffold(
        body: Column(children: [
      CardCart(cart: cart),
      ButtonTextCustom(
        title: "Continue",
        onPress: onContinuePress,
      )
    ])));
  }
}
