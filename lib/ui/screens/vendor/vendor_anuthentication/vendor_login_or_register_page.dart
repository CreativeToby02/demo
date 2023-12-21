import 'package:demo_app/ui/screens/vendor/vendor_anuthentication/login/vendor_login_screen.dart';
import 'package:demo_app/ui/screens/vendor/vendor_anuthentication/signup/vendor_signup_screen.dart';
import 'package:flutter/material.dart';

class VendorLoginOrSignUpScreen extends StatefulWidget {
  const VendorLoginOrSignUpScreen({super.key});

  @override
  State<VendorLoginOrSignUpScreen> createState() =>
      _VendorLoginOrSignUpScreenState();
}

class _VendorLoginOrSignUpScreenState extends State<VendorLoginOrSignUpScreen> {
  // show login page initially
  bool showLoginPage = true;

  // toggle btw login and signup screen

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return VendorLoginScreen(
        onTap: toggleScreen,
      );
    } else {
      return VendorSignupScreen(
        onTap: toggleScreen,
      );
    }
  }
}
