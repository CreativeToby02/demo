import 'package:demo_app/ui/screens/customer_authentication/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

class EmailCodeConfirmationScreen extends StatelessWidget {
  static const String name = 'email-code-confirmation';
  static const String route = '/email-code-confirmation';
  const EmailCodeConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    SvgPicture.asset('assets/icons/mark-email-read.svg'),
                    const SizedBox(height: 40),
                    Text(
                      'Check your mail',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'We have sent a password receiver instructions to your \nemail',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).go(AuthPageScreen.route);
                      },
                      child: const Text('Next'),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         'Did not receive the email? ',
                //         style: Theme.of(context)
                //             .textTheme
                //             .displaySmall
                //             ?.copyWith(color: Colors.black.withOpacity(0.5)),
                //       ),
                //       GestureDetector(
                //         child: Text('Click to resend',
                //             style: Theme.of(context).textTheme.displaySmall),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
