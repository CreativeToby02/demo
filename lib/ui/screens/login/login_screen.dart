import 'package:demo_app/ui/common/bottom_nav_bar.dart';
import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login';
  static const String route = '/login';
  const LoginScreen({super.key});

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
                Text(
                  'Login to your account',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  'It’s great to see you again',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
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
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      'Forgot your password? ',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: Colors.black.withOpacity(0.5)),
                    ),
                    GestureDetector(
                      onTap: () =>
                          GoRouter.of(context).push(ForgotPasswordScreen.route),
                      child: Text('Reset password',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(BottomNavigator.route);
                    },
                    child: const Text('Login')),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 0.5,
                        width: 20,
                        color: Colors.black,
                      ),
                    ),
                    const Text('   Or   '),
                    Expanded(
                      child: Container(
                        height: 0.5,
                        width: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const GoogleAuthButton(
                  title: 'Login with Google',
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: Colors.black.withOpacity(0.5)),
                    ),
                    Text('Join',
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
