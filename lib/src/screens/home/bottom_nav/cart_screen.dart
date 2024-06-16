// ignore_for_file: prefer_const_constructors

import 'package:bookstore/src/models/cart_model.dart';
import 'package:bookstore/src/widgets/custom_button.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:bookstore/src/widgets/product/card_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CartModel cart = CartModel("1", "1", "1", 4);
    return (Scaffold(body: CardCart(cart: cart)));
  }
}
