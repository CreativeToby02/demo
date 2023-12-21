// ignore_for_file: use_build_context_synchronously
import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/customer_authentication/auth_service.dart';
import 'package:demo_app/ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:demo_app/ui/screens/vendor/home/vendor_bottom_nav_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorLoginScreen extends StatefulWidget {
  static const String name = 'vendor-login';
  static const String route = '/vendor-login';
  const VendorLoginScreen({super.key, this.onTap});
  final Function()? onTap;

  @override
  State<VendorLoginScreen> createState() => _VendorLoginScreenState();
}

class _VendorLoginScreenState extends State<VendorLoginScreen> {
  bool isLoading = false;
  bool revealPassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        });
    try {
      // final loggedInUser =
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // ignore: unnecessary_null_comparison
      if (_auth.currentUser != null) {
        GoRouter.of(context).go(VendorBottomNavigator.route);
      }
    } on FirebaseAuthException catch (e) {
      displayErrorMessage(e.code);
      Navigator.pop(context);
    }
  }

  void displayErrorMessage(String message) {
    if (message == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No user found for that email.'),
        ),
      );
      // ignore: avoid_print
      print(message);
    } else if (message == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong password provided for that user.'),
        ),
      );
      // ignore: avoid_print
      print(message);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Insert login details'),
        ),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                Text(
                  'Login to your vendor account',
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
                StoreTextFormField(
                  hintText: 'Enter your email address',
                  controller: _emailController,
                  validator: (value) => EmailValidator.validate(value!)
                      ? null
                      : "Please enter a valid email",
                ),
                const SizedBox(height: 20),
                Text(
                  'Password',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                StorePasswordFormField(
                  hintText: 'Enter your password',
                  obscureText: revealPassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        revealPassword = !revealPassword;
                      });
                    },
                    child: revealPassword == true
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  ),
                  controller: _passwordController,
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
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    loginUser();
                  },
                  child: const Text('Login'),
                ),
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
                GoogleAuthButton(
                  onTap: () async => await AuthService().signInWithGoogle(),
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
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Join',
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
