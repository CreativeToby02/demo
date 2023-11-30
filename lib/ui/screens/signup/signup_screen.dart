import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  static const String name = 'signup';
  static const String route = '/signup';
  const SignupScreen({super.key});

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
                  'Create an account',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  'Let’s create your account',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                Text(
                  'Full name',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const StoreTextFormField(
                  hintText: 'Enter your full name',
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
                const SizedBox(height: 40),
                ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
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
                  title: 'Sign Up with Google',
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member? ',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: Colors.black.withOpacity(0.5)),
                    ),
                    GestureDetector(
                      onTap: () => GoRouter.of(context).push(LoginScreen.route),
                      child: Text('Log In',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
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
