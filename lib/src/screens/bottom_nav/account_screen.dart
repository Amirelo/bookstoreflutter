import 'package:bookstore/src/screens/home/account/about_us_screen.dart';
import 'package:bookstore/src/screens/home/account/address_screen.dart';
import 'package:bookstore/src/screens/home/account/coupon_screen.dart';
import 'package:bookstore/src/screens/home/account/notification_screen.dart';
import 'package:bookstore/src/screens/home/account/order_screen.dart';
import 'package:bookstore/src/screens/home/account/profile_screen.dart';
import 'package:bookstore/src/screens/home/account/return_screen.dart';
import 'package:bookstore/src/screens/home/account/setting_screen.dart';
import 'package:bookstore/src/screens/home/account/shipping_screen.dart';
import 'package:flutter/material.dart';
import '../../constants/app_constant.dart' as Constants;

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    void onCardPress(String navName) {
      Widget screen;
      switch (navName) {
        case Constants.NAV_PROFILE:
          screen = ProfileScreen();
          break;
        case Constants.NAV_NOTIFICATION:
          screen = NotifcationScreen();
          break;
        case Constants.NAV_ORDER:
          screen = OrderScreen();
          break;
        case Constants.NAV_ADDRESS:
          screen = AddressScreen();
          break;
        case Constants.NAV_COUPON:
          screen = CouponScreen();
          break;
        case Constants.NAV_SETTING:
          screen = SettingScreen();
          break;
        case Constants.NAV_ABOUT_US:
          screen = AboutUsScreen();
          break;
        case Constants.NAV_SETTING:
          screen = ShippingScreen();
          break;
        case Constants.NAV_RETURN_POLICY:
          screen = ReturnScreen();
          break;
        default:
          debugPrint("No path found");
          screen = AccountScreen();
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }

    return (Scaffold(
      body: Column(children: [
        const Text("My Account"),
        TextButton(
            onPressed: () => onCardPress(Constants.NAV_PROFILE),
            child: const Text("Profile")),
        TextButton(
            onPressed: () => onCardPress(Constants.NAV_NOTIFICATION),
            child: const Text("Notifications")),
        TextButton(
            onPressed: () => onCardPress(Constants.NAV_ORDER),
            child: const Text("Orders")),
        TextButton(
            onPressed: () => onCardPress(Constants.NAV_ADDRESS),
            child: const Text("Addresses")),
        TextButton(
            onPressed: () => onCardPress(Constants.NAV_COUPON),
            child: const Text("Coupons")),
        TextButton(
            onPressed: () => onCardPress(Constants.NAV_SETTING),
            child: const Text("Settings")),
        TextButton(onPressed: () {}, child: const Text("Logout")),
        const Text("App"),
        TextButton(
            onPressed: () => onCardPress(Constants.NAV_ABOUT_US),
            child: const Text("About us")),
        TextButton(
            onPressed: () => onCardPress(Constants.NAV_SHIPPING),
            child: const Text("Shipping")),
        TextButton(
            onPressed: () => onCardPress(Constants.NAV_RETURN_POLICY),
            child: const Text("Return")),
      ]),
    ));
  }
}
