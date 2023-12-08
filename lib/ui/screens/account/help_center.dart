import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  static const String name = 'help-center';
  static const String route = '/help-center';
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(title: 'Help Center'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.black,
                ),
                const SizedBox(height: 30),
                const HelpCenterOption(
                  title: 'Customer Service',
                ),
                const HelpCenterOption(
                  title: 'WhatsApp',
                ),
                const HelpCenterOption(
                  title: 'Website',
                ),
                const HelpCenterOption(
                  title: 'Facebook',
                ),
                const HelpCenterOption(
                  title: 'Twitter',
                ),
                const HelpCenterOption(
                  title: 'Instagram',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HelpCenterOption extends StatelessWidget {
  const HelpCenterOption({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.attach_money_rounded),
          const SizedBox(width: 15),
          Text(
            '$title',
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
