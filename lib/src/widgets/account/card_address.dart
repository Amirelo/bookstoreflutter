import 'package:bookstore/src/models/address_model.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardAddress extends StatelessWidget {
  final AddressModel address;
  const CardAddress({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    String fullAddress =
        "${address.street} ${address.streetName}, ${address.ward} Ward, ${address.district} District, ${address.city} city";
    return (Container(
      child: Column(children: [
        Row(
          children: [
            CustomText(title: "Full address"),
            CustomText(title: fullAddress),
          ],
        ),
        Row(
          children: [
            CustomText(title: "Street"),
            CustomText(title: "${address.street} ${address.streetName}"),
          ],
        ),
        Row(
          children: [
            CustomText(title: "Ward"),
            CustomText(title: "${address.ward}"),
          ],
        ),
        Row(
          children: [
            CustomText(title: "District"),
            CustomText(title: "${address.district}"),
          ],
        ),
        Row(
          children: [
            CustomText(title: "City"),
            CustomText(title: "${address.city}"),
          ],
        ),
      ]),
    ));
  }
}
