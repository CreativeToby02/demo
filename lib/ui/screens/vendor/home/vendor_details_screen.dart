import 'package:demo_app/ui/common/alert_dailog_widgets.dart';
import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';

class VendorDetailsScreen extends StatefulWidget {
  static const String name = 'vendor-details';
  static const String route = '/vendor-details';
  const VendorDetailsScreen({super.key});

  @override
  State<VendorDetailsScreen> createState() => _VendorDetailsScreenState();
}

class _VendorDetailsScreenState extends State<VendorDetailsScreen> {
  final dateInput = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();
  final gender = TextEditingController();
  final phoneNumber = TextEditingController();

  void _showLogoutAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return VendorLogoutAlertDialog();
        },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(
        title: 'Vendor Details',
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
                    hintText: 'userName',
                    controller: fullName,
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
                    controller: email,
                  ),
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
                SizedBox(
                    height: 53,
                    child: StoreTextField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                    )),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                     setState(() {
                    _showLogoutAlertDialog();
                  });
                  },
                  child: const Text('Logout'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
