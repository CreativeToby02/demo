import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/customer_authentication/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String name = 'reset-password';
  static const String route = '/reset-password';
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.done,
                  size: 50,
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Password Changed!',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Text(
                  'You can now use your new password to login to your account.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(LoginScreen.route);
                    },
                    child: const Text('Continue'))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ReturnButton(),
                Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  'Set the new password for your account so \nyou can login and access all the features.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  'Password',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const StoreTextFormField(
                  hintText: 'Enter your password',
                  suffixIcon: Icon(Icons.visibility_outlined),
                ),
                const SizedBox(height: 20),
                Text(
                  'Confirm Password',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const StoreTextFormField(
                  hintText: 'Enter your password',
                  suffixIcon: Icon(Icons.visibility_outlined),
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                    onPressed: () {
                      _showAlertDialog();
                    },
                    child: const Text('Continue')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
