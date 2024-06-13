import 'package:bookstore/src/screens/auth/sign_in_screen.dart';
import 'package:bookstore/src/screens/home/account/about_us_screen.dart';
import 'package:bookstore/src/screens/home/account/address_screen.dart';
import 'package:bookstore/src/screens/home/account/coupon_screen.dart';
import 'package:bookstore/src/screens/home/account/notification_screen.dart';
import 'package:bookstore/src/screens/home/account/order_screen.dart';
import 'package:bookstore/src/screens/home/account/profile_screen.dart';
import 'package:bookstore/src/screens/home/account/return_screen.dart';
import 'package:bookstore/src/screens/home/account/setting_screen.dart';
import 'package:bookstore/src/screens/home/account/shipping_screen.dart';
import 'package:bookstore/src/widgets/account/card_account.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../constants/app_constant.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    void onCardPress(String navName) {
      Widget screen;
      switch (navName) {
        case NAV_PROFILE:
          screen = const ProfileScreen();
          break;
        case NAV_NOTIFICATION:
          screen = const NotifcationScreen();
          break;
        case NAV_ORDER:
          screen = const OrderScreen();
          break;
        case NAV_ADDRESS:
          screen = const AddressScreen();
          break;
        case NAV_COUPON:
          screen = const CouponScreen();
          break;
        case NAV_SETTING:
          screen = const SettingScreen();
          break;
        case NAV_ABOUT_US:
          screen = const AboutUsScreen();
          break;
        case NAV_SHIPPING:
          screen = const ShippingScreen();
          break;
        case NAV_RETURN_POLICY:
          screen = const ReturnScreen();
          break;
        default:
          debugPrint("No path found");
          screen = const AccountScreen();
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }

    void onLogoutPress() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()));
    }

    return (Scaffold(
      body: Container(
        width: const BoxConstraints().maxWidth,
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Column(children: [
          const Align(
            alignment: Alignment.topLeft,
            child: CustomText(
              title: "My Account",
              fontPreset: FontPresets.title,
              paddingBottom: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 20,
              runSpacing: 20,
              children: [
                CardAccount(
                  title: "Profile",
                  icon: Icons.person,
                  onPress: () => onCardPress(NAV_PROFILE),
                ),
                CardAccount(
                  title: "Notification",
                  icon: Icons.notifications,
                  onPress: () => onCardPress(NAV_NOTIFICATION),
                ),
                CardAccount(
                  title: "Orders",
                  icon: Icons.person,
                  onPress: () => onCardPress(NAV_ORDER),
                ),
                CardAccount(
                  title: "Addresses",
                  icon: Icons.person,
                  onPress: () => onCardPress(NAV_ADDRESS),
                ),
                CardAccount(
                  title: "Coupons",
                  icon: Icons.discount,
                  onPress: () => onCardPress(NAV_COUPON),
                ),
                CardAccount(
                  title: "Settings",
                  icon: Icons.settings,
                  onPress: () => onCardPress(NAV_SETTING),
                ),
                CardAccount(
                  title: "Logout",
                  icon: Icons.logout,
                  onPress: onLogoutPress,
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: CustomText(
              title: "App",
              fontPreset: FontPresets.title,
              paddingBottom: 20,
            ),
          ),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              CardAccount(
                title: "About us",
                icon: Icons.group,
                onPress: () => onCardPress(NAV_ABOUT_US),
              ),
              CardAccount(
                title: "Shipping",
                icon: Icons.delivery_dining,
                onPress: () => onCardPress(NAV_SHIPPING),
              ),
              CardAccount(
                title: "About us",
                icon: Icons.assignment_returned,
                onPress: () => onCardPress(NAV_RETURN_POLICY),
              ),
            ],
          )
        ]),
      ),
    ));
  }
}
