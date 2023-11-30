import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class NotificationScreen extends StatelessWidget {
  static const String name = 'notification';
  static const String route = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StoreAppBar(
                title: 'Notifications',
                icon: SizedBox(),
              ),
              const SizedBox(height: 15),
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 185),
                    SvgPicture.asset('assets/icons/big-search.svg'),
                    const SizedBox(height: 5),
                    Text(
                      'You haven’t gotten any notifications yet!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'We’ll alert you when something cool happens',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
