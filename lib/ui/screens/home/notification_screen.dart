import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
// import 'package:svg_flutter/svg_flutter.dart';

class NotificationScreen extends StatelessWidget {
  static const String name = 'notification';
  static const String route = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(
        title: 'Notifications',
        icon: SizedBox(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.black,
              ),
              const SizedBox(height: 30),
              // Center(
              //   child: Column(
              //     children: [
              //       const SizedBox(height: 185),
              //       SvgPicture.asset('assets/icons/big-search.svg'),
              //       const SizedBox(height: 5),
              //       Text(
              //         'You haven’t gotten any notifications yet!',
              //         textAlign: TextAlign.center,
              //         style: Theme.of(context).textTheme.displayMedium,
              //       ),
              //       const SizedBox(height: 5),
              //       Text(
              //         'We’ll alert you when something cool happens',
              //         style: Theme.of(context)
              //             .textTheme
              //             .displaySmall
              //             ?.copyWith(fontSize: 14),
              //       )
              //     ],
              //   ),
              // ),

              Text(
                'Today',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 20),
              NotificationContainer(),
              const SizedBox(height: 30),
              Text(
                'Yesterday',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 20),
              NotificationContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/rec-background.png'),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '30% Special Discount!',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'Special promotion only valid today.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
