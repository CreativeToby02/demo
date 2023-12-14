import 'package:demo_app/ui/screens/authentication/login/login_screen.dart';
import 'package:demo_app/ui/screens/authentication/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginOrSignUpScreen extends StatefulWidget {
  const LoginOrSignUpScreen({super.key});

  @override
  State<LoginOrSignUpScreen> createState() => _LoginOrSignUpScreenState();
}

class _LoginOrSignUpScreenState extends State<LoginOrSignUpScreen> {
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
      return LoginScreen(
        onTap: toggleScreen,
      );
    } else {
      return SignupScreen(
        onTap: toggleScreen,
      );
    }
  }
}
