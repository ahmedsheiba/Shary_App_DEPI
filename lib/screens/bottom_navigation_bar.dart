import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sharyApp/screens/cart_view.dart';
import 'package:sharyApp/screens/home_view.dart';
import 'package:sharyApp/screens/setting_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});
  static String id = 'BottomNavigation';

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _view = 0;
  final _views = [HomeView(), const CartView(), const SettingView()];
  var iconsList = [Icons.home, Icons.shopping_cart, Icons.settings];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_view],
      bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.grey.shade600,
          backgroundColor: Colors.purple.shade800,
          color: Colors.purple.shade900,
          index: 0,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _view = index;
            });
          },
          items: const [
            Icon(Icons.home),
            Icon(Icons.shopping_cart),
            Icon(Icons.settings),
          ]),
    );
  }
}
