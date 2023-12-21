import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';

class NotificationSettingScreen extends StatelessWidget {
  static const String name = 'notification-setting';
  static const String route = '/notification-setting';
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(
        title: 'Notification',
        icon: SizedBox(),
      ),
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
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Generation Notifications',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const StoreToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sound',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const StoreToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Vibrate',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const StoreToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Special Offers',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const StoreToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Promo & Discounts',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const StoreToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payments',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const StoreToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cashback',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const StoreToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'App Updates',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const StoreToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Service Available',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const StoreToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Tips Available',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const StoreToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StoreToggleSwitch extends StatelessWidget {
  const StoreToggleSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 42,
      height: 20,
      padding: 3,
      toggleSize: 18,
      borderRadius: 30,
      activeColor: Colors.black,
      value: true,
      onToggle: (value) {},
    );
  }
}
