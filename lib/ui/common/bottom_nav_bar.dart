// ignore_for_file: deprecated_member_use
import 'package:demo_app/ui/screens/home/cart_screen.dart';
import 'package:demo_app/ui/screens/home/home.dart';
import 'package:demo_app/ui/screens/home/saved_item_screen.dart';
import 'package:demo_app/ui/screens/home/search_screen.dart';
import 'package:demo_app/ui/screens/home/user_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class BottomNavigator extends StatefulWidget {
  static const String name = 'bottom-navigator';
  static const String route = '/bottom-navigator';
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const SavedItemScreen(),
    const CartScreen(),
    const UserAccountScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home-icon.svg',
              color: Colors.black38,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home-icon.svg',
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/search-icon.svg',
              color: Colors.black38,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/search-icon.svg',
              color: Colors.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/favorite-icon.svg',
              color: Colors.black38,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/favorite-icon.svg',
              color: Colors.black,
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/shopping-bag.svg',
              color: Colors.black38,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/shopping-bag.svg',
              color: Colors.black,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
              color: Colors.black38,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/settings.svg',
              color: Colors.black,
            ),
            label: 'Account',
          )
        ],
      ),
    );
  }
}
