import 'package:bookstore/src/models/coupon_model.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardCoupon extends StatelessWidget {
  final CouponModel coupon;
  const CardCoupon({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: const BoxConstraints().maxWidth,
      height: 200,
      child: Row(children: [
        CustomImage(
          imageLink: coupon.image,
          width: 200,
          height: 200,
        ),
        Column(
          children: [
            CustomText(title: coupon.name),
            CustomText(title: coupon.description),
          ],
        ),
        Column(
          children: [
            CustomText(title: coupon.endDate.toString()),
            CustomText(title: coupon.orderID != "" ? "Used" : "Available"),
            CustomText(title: coupon.orderID)
          ],
        )
      ]),
    ));
  }
}
