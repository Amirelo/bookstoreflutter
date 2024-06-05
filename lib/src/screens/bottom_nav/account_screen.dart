import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(children: [
        const Text("My Account"),
        TextButton(onPressed: () {}, child: const Text("Profile")),
        TextButton(onPressed: () {}, child: const Text("Notifications")),
        TextButton(onPressed: () {}, child: const Text("Orders")),
        TextButton(onPressed: () {}, child: const Text("Addresses")),
        TextButton(onPressed: () {}, child: const Text("Coupons")),
        TextButton(onPressed: () {}, child: const Text("Settings")),
        TextButton(onPressed: () {}, child: const Text("Logout")),
        const Text("App"),
        TextButton(onPressed: () {}, child: const Text("About us")),
        TextButton(onPressed: () {}, child: const Text("Shipping")),
        TextButton(onPressed: () {}, child: const Text("Return")),
      ]),
    ));
  }
}
