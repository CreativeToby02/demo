import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/forgot_password/confirm_email_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String name = 'forgot-password';
  static const String route = '/forgot-password';
  const ForgotPasswordScreen({super.key});

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
                'Forgot password',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'Enter your email for the verification process. \nWe will send 4 digits code to your email.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'Email',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              const StoreTextFormField(
                hintText: 'Enter your email address',
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .push(EmailCodeConfirmationScreen.route);
                  },
                  child: const Text('Send Code')),
            ],
          ),
        ),
      ),
    );
  }
}
