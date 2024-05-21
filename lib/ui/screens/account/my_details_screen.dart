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
  String? username, email;

  late SharedPreferences prefs;

  Future getUsername() async {
    prefs = await SharedPreferences.getInstance();
    username = prefs.getString(SharedPrefKeys.userName);
    email = prefs.getString(SharedPrefKeys.userEmail);
    setState(() {});
  }

  final _dateInput = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

  String selectedGender = 'Male';
  var genders = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(
        title: 'My Details',
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
                    hintText: username,
                    controller: _usernameController,
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
                SizedBox(
                  height: 53,
                  child: StoreTextField(
                    controller: _emailController,
                    hintText: email,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Date of Birth',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 53,
                  child: DatePickerField(dateInput: _dateInput),
                ),
                const SizedBox(height: 20),
                Text(
                  'Gender',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: DropDownMenuOption(
                      items: genders
                          .map(
                            (gender) => DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            ),
                          )
                          .toList(),
                      onChanged: (genders) {
                        setState(() {
                          selectedGender = genders!;
                        });
                      }),
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone Number',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 53,
                  child: DropdownMenuItem(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF000000).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      prefs.setString(
                          SharedPrefKeys.userName, _usernameController.text);
                      username = prefs.getString(SharedPrefKeys.userName);
                      prefs.setString(
                          SharedPrefKeys.userEmail, _emailController.text);
                      email = prefs.getString(SharedPrefKeys.userEmail);
                    });
                  },
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
