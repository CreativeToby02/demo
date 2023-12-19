// ignore_for_file: deprecated_member_use
import 'package:demo_app/ui/screens/vendor/home/add_product_screen.dart';
import 'package:demo_app/ui/screens/vendor/home/products_listed_screen.dart';
import 'package:demo_app/ui/screens/vendor/home/vendor_details_screen.dart';
import 'package:flutter/material.dart';

class VendorBottomNavigator extends StatefulWidget {
  static const String name = 'vendor-bottom-navigator';
  static const String route = '/vendor-bottom-navigator';
  const VendorBottomNavigator({super.key});

  @override
  State<VendorBottomNavigator> createState() => _VendorBottomNavigatorState();
}

class _VendorBottomNavigatorState extends State<VendorBottomNavigator> {
  List<Widget> screens = [
    const ProductsListedScreen(),
    const AddProductScreen(),
    const VendorDetailsScreen(),
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
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.black38),
            activeIcon: Icon(Icons.menu, color: Colors.black),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.black38),
            activeIcon: Icon(Icons.add, color: Colors.black),
            label: 'Add Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black38),
            activeIcon: Icon(Icons.settings, color: Colors.black),
            label: 'Account',
          )
        ],
      ),
    );
  }
}
