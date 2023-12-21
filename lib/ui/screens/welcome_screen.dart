import 'package:demo_app/ui/screens/customer_authentication/auth_page.dart';
import 'package:demo_app/ui/screens/vendor/vendor_anuthentication/vendor_auth_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  static const name = 'welcome';
  static const route = '/welcome';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 20),
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Choose Account To Open',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(VendorAuthPageScreen.route);
              },
              child: const Text('Vendor'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(AuthPageScreen.route);
              },
              child: const Text('Consumer'),
            ),
          ],
        ),
      ),
    );
  }
}
