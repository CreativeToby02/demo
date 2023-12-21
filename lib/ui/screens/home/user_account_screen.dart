import 'package:demo_app/ui/common/alert_dailog_widgets.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/account/address_screen.dart';
import 'package:demo_app/ui/screens/account/help_center.dart';
import 'package:demo_app/ui/screens/account/my_details_screen.dart';
import 'package:demo_app/ui/screens/account/my_orders_screen.dart';
import 'package:demo_app/ui/screens/account/notification_setting_screen.dart';
import 'package:demo_app/ui/screens/account/payment_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserAccountScreen extends StatefulWidget {
  static const String name = 'user-account';
  static const String route = '/user-account';
  const UserAccountScreen({super.key});

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  void _showLogoutAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return LogoutAlertDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(prefixIcon: SizedBox(), title: 'Account'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 2,
                  color: Colors.black26,
                ),
              ),
              const SizedBox(height: 10),
              AccountOptions(
                onPressed: () =>
                    GoRouter.of(context).push(MyOrdersScreen.route),
                icon: Icons.business_center_outlined,
                optionType: 'My Orders',
              ),
              const Divider(
                thickness: 7,
                color: Color(0xFFD9D9D9),
              ),
              AccountOptions(
                onPressed: () =>
                    GoRouter.of(context).push(MyDetailsScreen.route),
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
              AccountOptions(
                onPressed: () => GoRouter.of(context).push(AddressScreen.route),
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
              AccountOptions(
                onPressed: () =>
                    GoRouter.of(context).push(PaymentMethodScreen.route),
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
              AccountOptions(
                onPressed: () =>
                    GoRouter.of(context).push(NotificationSettingScreen.route),
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
              AccountOptions(
                onPressed: () =>
                    GoRouter.of(context).push(HelpCenterScreen.route),
                icon: Icons.headset_mic_outlined,
                optionType: 'Help Center',
              ),
              const Divider(
                thickness: 7,
                color: Color(0xFFD9D9D9),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    _showLogoutAlertDialog();
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 25, left: 30, right: 30, bottom: 25),
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
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
