import 'package:bookstore/src/models/order_model.dart';
import 'package:bookstore/src/widgets/account/card_order.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<OrderModel> orderList = List.generate(
        5,
        (index) =>
            OrderModel("$index", "TEST", 50000, DateTime.now(), "1", "1"));

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: const BoxConstraints().maxWidth,
            height: 300,
            child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (context, index) =>
                    CardOrder(order: orderList[index])),
          )
        ],
      ),
    );
  }
}
