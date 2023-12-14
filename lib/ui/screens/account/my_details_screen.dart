import 'package:demo_app/core/utils/shared_preferences_keys.dart';
import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDetailsScreen extends StatefulWidget {
  static const String name = 'my-details';
  static const String route = '/my-details';
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  String? userName;

  getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(SharedPrefKeys.userName);
    return userName;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
    print(userName);
  }

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
                SizedBox(
                  height: 53,
                  child: StoreTextField(
                    hintText: userName,
                  ),
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
