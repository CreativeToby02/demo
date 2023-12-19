// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison
import 'package:demo_app/core/utils/shared_preferences_keys.dart';
import 'package:demo_app/ui/screens/customer_authentication/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo_app/ui/common/bottom_nav_bar.dart';
import 'package:demo_app/ui/common/text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  static const String name = 'signup';
  static const String route = '/signup';
  const SignupScreen({super.key, this.onTap});
  final Function()? onTap;

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool revealPassword = true;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  //sign up user
  Future<void> signUpUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        });

    if (_usernameController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter Full Name'),
        ),
      );
      Navigator.pop(context);
    } else {
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        if (newUser != null) {
          setState(() async {
            await saveUsername(
                SharedPrefKeys.userName, _usernameController.text);
          });
          GoRouter.of(context).push(BottomNavigator.route);
        }
      } on FirebaseAuthException catch (e) {
        displayErrorMessage(e.code);
        Navigator.pop(context);
      }
    }
  }

  void displayErrorMessage(String message) {
    if (message == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The password provided is too weak.'),
        ),
      );
    } else if (message == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The account already exists for that email.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Insert new account details'),
        ),
      );
    }
  }

  saveUsername(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
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
                StoreTextFormField(
                  hintText: 'Enter your full name',
                  controller: _usernameController,
                ),
                const SizedBox(height: 20),
                Text(
                  'Email',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                StoreTextFormField(
                  hintText: 'Enter your email address',
                  keyboardType: TextInputType.emailAddress,
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
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    signUpUser();

                    print(SharedPrefKeys.userName);
                  },
                  child: const Text('Sign Up'),
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
                  onTap: () => AuthService().signInWithGoogle(),
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
                      onTap: widget.onTap,
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
