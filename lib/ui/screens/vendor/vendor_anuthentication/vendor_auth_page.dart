import 'package:demo_app/ui/screens/vendor/home/vendor_bottom_nav_bar.dart';
import 'package:demo_app/ui/screens/vendor/vendor_anuthentication/vendor_login_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VendorAuthPageScreen extends StatefulWidget {
  static const String name = 'vendor-auth-page';
  static const String route = '/vendor-auth-page';
  const VendorAuthPageScreen({super.key});

  @override
  State<VendorAuthPageScreen> createState() => _VendorAuthPageScreenState();
}

class _VendorAuthPageScreenState extends State<VendorAuthPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const VendorBottomNavigator();
          }
          // user not logged in
          else {
            return const VendorLoginOrSignUpScreen();
          }
        },
      ),
    );
  }
}
