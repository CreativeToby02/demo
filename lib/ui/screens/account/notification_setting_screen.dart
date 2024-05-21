import 'package:demo_app/core/utils/shared_preferences_keys.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettingScreen extends StatefulWidget {
  static const String name = 'notification-setting';
  static const String route = '/notification-setting';
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool notification1 = false;
  bool notification2 = false;
  bool notification3 = false;
  bool notification4 = false;
  bool notification5 = false;
  bool notification6 = false;
  bool notification7 = false;
  bool notification8 = false;
  bool notification9 = false;
  bool notification10 = false;

  late SharedPreferences prefs;

  Future getNotifications() async {
    prefs = await SharedPreferences.getInstance();
    notification1 = prefs.getBool(SharedPrefKeys.service1) ?? false;
    notification2 = prefs.getBool(SharedPrefKeys.service2) ?? false;
    notification3 = prefs.getBool(SharedPrefKeys.service3) ?? false;
    notification4 = prefs.getBool(SharedPrefKeys.service4) ?? false;
    notification5 = prefs.getBool(SharedPrefKeys.service5) ?? false;
    notification6 = prefs.getBool(SharedPrefKeys.service6) ?? false;
    notification7 = prefs.getBool(SharedPrefKeys.service7) ?? false;
    notification8 = prefs.getBool(SharedPrefKeys.service8) ?? false;
    notification9 = prefs.getBool(SharedPrefKeys.service9) ?? false;
    notification10 = prefs.getBool(SharedPrefKeys.service10) ?? false;
    setState(() {});
  }

  Future setNotifications() async {
    await prefs.setBool(SharedPrefKeys.service1, notification1);
    await prefs.setBool(SharedPrefKeys.service2, notification2);
    await prefs.setBool(SharedPrefKeys.service3, notification3);
    await prefs.setBool(SharedPrefKeys.service4, notification4);
    await prefs.setBool(SharedPrefKeys.service5, notification5);
    await prefs.setBool(SharedPrefKeys.service6, notification6);
    await prefs.setBool(SharedPrefKeys.service7, notification7);
    await prefs.setBool(SharedPrefKeys.service8, notification8);
    await prefs.setBool(SharedPrefKeys.service9, notification9);
    await prefs.setBool(SharedPrefKeys.service10, notification10);
  }

  @override
  void initState() {
    super.initState();
    getNotifications();
  }

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
                    StoreToggleSwitch(
                      value: notification1,
                      onToggle: (value) {
                        setState(() {
                          notification1 = value;
                          setNotifications();
                        });
                      },
                    ),
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
                    StoreToggleSwitch(
                      value: notification2,
                      onToggle: (value) {
                        setState(() {
                          notification2 = value;
                          setNotifications();
                        });
                      },
                    ),
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
                    StoreToggleSwitch(
                      value: notification3,
                      onToggle: (value) {
                        setState(() {
                          notification3 = value;
                          setNotifications();
                        });
                      },
                    ),
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
                    StoreToggleSwitch(
                      value: notification4,
                      onToggle: (value) {
                        setState(() {
                          notification4 = value;
                          setNotifications();
                        });
                      },
                    ),
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
                    StoreToggleSwitch(
                      value: notification5,
                      onToggle: (value) {
                        setState(() {
                          notification5 = value;
                          setNotifications();
                        });
                      },
                    ),
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
                    StoreToggleSwitch(
                      value: notification6,
                      onToggle: (value) {
                        setState(() {
                          notification6 = value;
                          setNotifications();
                        });
                      },
                    ),
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
                    StoreToggleSwitch(
                      value: notification7,
                      onToggle: (value) {
                        setState(() {
                          notification7 = value;
                          setNotifications();
                        });
                      },
                    ),
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
                    StoreToggleSwitch(
                      value: notification8,
                      onToggle: (value) {
                        setState(() {
                          notification8 = value;
                          setNotifications();
                        });
                      },
                    ),
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
                    StoreToggleSwitch(
                      value: notification9,
                      onToggle: (value) {
                        setState(() {
                          notification9 = value;
                          setNotifications();
                        });
                      },
                    ),
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
                    StoreToggleSwitch(
                      value: notification10,
                      onToggle: (value) {
                        setState(() {
                          notification10 = value;
                          setNotifications();
                        });
                      },
                    ),
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
    required this.onToggle,
    required this.value,
  });

  final Function(bool) onToggle;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 42,
      height: 20,
      padding: 3,
      toggleSize: 18,
      borderRadius: 30,
      activeColor: Colors.black,
      value: value,
      onToggle: onToggle,
    );
  }
}
