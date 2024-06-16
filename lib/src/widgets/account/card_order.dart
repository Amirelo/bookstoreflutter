import 'package:bookstore/src/models/order_model.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardOrder extends StatelessWidget {
  final OrderModel order;
  const CardOrder({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      child: Column(
        children: [
          CustomText(title: "Order date: ${order.orderDate}"),
          CustomText(title: "Price: ${order.totalPrice}"),
        ],
      ),
    ));
  }
}
