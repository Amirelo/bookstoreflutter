import 'dart:math';

import 'package:bookstore/src/models/address_model.dart';
import 'package:bookstore/src/widgets/account/card_address.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<AddressModel> addressList = List.generate(
        4,
        (index) => AddressModel(
            "$index",
            "${Random().nextInt(500)}",
            "Test $index Street",
            "Test $index Ward",
            "Test $index District",
            "Test $index City"));

    return (Scaffold(
        body: ListView.builder(
            itemCount: addressList.length,
            itemBuilder: (context, index) =>
                CardAddress(address: addressList[index]))));
  }
}
