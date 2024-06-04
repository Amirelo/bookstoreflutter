import 'package:bookstore/src/screens/home/account_screen.dart';
import 'package:bookstore/src/screens/home/cart_screen.dart';
import 'package:bookstore/src/screens/home/explore_screen.dart';
import 'package:bookstore/src/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    const List<Widget> screens = [
      HomeScreen(),
      ExploreScreen(),
      CartScreen(),
      AccountScreen()
    ];

    return (Scaffold(
      body: SafeArea(child: screens.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        backgroundColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
        ],
      ),
    ));
  }
}
