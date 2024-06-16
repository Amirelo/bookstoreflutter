import 'package:bookstore/src/models/coupon_model.dart';
import 'package:bookstore/src/widgets/account/card_coupon.dart';
import 'package:flutter/material.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CouponModel> couponList = List.generate(
        5,
        (index) => CouponModel(
            "$index",
            "Coupon #$index",
            "Coupon description",
            "https://images.pexels.com/photos/13862436/pexels-photo-13862436.png",
            "%10",
            50000,
            DateTime.now(),
            "1",
            "1"));
    return (Scaffold(
      body: Column(
        children: [
          ListView.builder(
              itemCount: couponList.length,
              itemBuilder: (context, index) =>
                  CardCoupon(coupon: couponList[index])),
        ],
      ),
    ));
  }
}
