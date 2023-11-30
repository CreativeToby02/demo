import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String name = 'reset-password';
  static const String route = '/reset-password';
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    AlertDialog();
                  },
                  child: const Text('Continue')),
            ],
          ),
        ),
      ),
    );
  }
}
