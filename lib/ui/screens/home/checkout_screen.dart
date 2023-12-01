import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  static const String name = 'checkout';
  static const String route = '/checkout';
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StoreAppBar(
                title: 'Checkout',
              ),
              const SizedBox(height: 15),
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.black,
              ),
              Text('Delivery Address'),
            ],
          ),
        ),
      ),
    );
  }
}
