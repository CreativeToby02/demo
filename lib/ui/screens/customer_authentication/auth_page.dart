import 'package:demo_app/ui/common/bottom_nav_bar.dart';
import 'package:demo_app/ui/screens/customer_authentication/login_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPageScreen extends StatefulWidget {
  static const String name = 'auth-page';
  static const String route = '/auth-page';
  const AuthPageScreen({super.key});

  @override
  State<AuthPageScreen> createState() => _AuthPageScreenState();
}

class _AuthPageScreenState extends State<AuthPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const BottomNavigator();
          }
          // user not logged in
          else {
            return const LoginOrSignUpScreen();
          }
        },
      ),
    );
  }
}
