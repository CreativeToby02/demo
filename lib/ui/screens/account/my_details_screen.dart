import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';

class MyDetailsScreen extends StatelessWidget {
  static const String name = 'my-details';
  static const String route = '/my-details';
  const MyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(title: 'My Details'),
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
                Text(
                  'Full Name',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 53,
                  child: StoreTextField(),
                ),
                const SizedBox(height: 20),
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 53,
                  child: StoreTextField(),
                ),
                const SizedBox(height: 20),
                Text(
                  'Date of Birth',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 53,
                  child: StoreTextField(),
                ),
                const SizedBox(height: 20),
                Text(
                  'Gender',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 53,
                  child: StoreTextField(),
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone Number',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 53,
                  child: StoreTextField(),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
