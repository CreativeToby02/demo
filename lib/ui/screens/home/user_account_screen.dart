import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';

class UserAccountScreen extends StatelessWidget {
  static const String name = 'user-account';
  static const String route = '/user-account';
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: StoreAppBar(
                  title: 'Account',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 2,
                  color: Colors.black26,
                ),
              ),
              const SizedBox(height: 10),
              const AccountOptions(
                icon: Icons.business_center_outlined,
                optionType: 'My Orders',
              ),
              const Divider(
                thickness: 7,
                color: Color(0xFFD9D9D9),
              ),
              const AccountOptions(
                icon: Icons.contacts_outlined,
                optionType: 'My Details',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Divider(
                  height: 2,
                  color: Colors.black26,
                ),
              ),
              const AccountOptions(
                icon: Icons.home_outlined,
                optionType: 'Address Book',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Divider(
                  height: 2,
                  color: Colors.black26,
                ),
              ),
              const AccountOptions(
                icon: Icons.credit_card,
                optionType: 'Payment Methods',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Divider(
                  height: 2,
                  color: Colors.black26,
                ),
              ),
              const AccountOptions(
                icon: Icons.notifications_none_outlined,
                optionType: 'Notifications',
              ),
              const Divider(
                thickness: 7,
                color: Color(0xFFD9D9D9),
              ),
              const AccountOptions(
                icon: Icons.help_outline_rounded,
                optionType: 'FAQs',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Divider(
                  height: 2,
                  color: Colors.black26,
                ),
              ),
              const AccountOptions(
                icon: Icons.headset_mic_outlined,
                optionType: 'Help Center',
              ),
              const Divider(
                thickness: 7,
                color: Color(0xFFD9D9D9),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Color(0xFFED2828),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Logout',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountOptions extends StatelessWidget {
  const AccountOptions({
    super.key,
    this.optionType,
    this.icon,
  });
  final String? optionType;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 30, right: 30, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 20),
              Text(
                '$optionType',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}