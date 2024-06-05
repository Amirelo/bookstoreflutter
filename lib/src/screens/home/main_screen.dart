import 'package:bookstore/src/screens/bottom_nav/EBookScreen.dart';
import 'package:bookstore/src/screens/bottom_nav/account_screen.dart';
import 'package:bookstore/src/screens/bottom_nav/cart_screen.dart';
import 'package:bookstore/src/screens/bottom_nav/explore_screen.dart';
import 'package:bookstore/src/screens/bottom_nav/home_screen.dart';
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
      EBookScreen(),
      CartScreen(),
      AccountScreen()
    ];

    return (Scaffold(
      body: SafeArea(child: screens.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onItemTapped,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "E-Book"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
        ],
      ),
    ));
  }
}
