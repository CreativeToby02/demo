import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/account/address_screen.dart';
import 'package:demo_app/ui/screens/account/payment_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends StatefulWidget {
  static const String name = 'checkout';
  static const String route = '/checkout';
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool selected1 = true;
  bool selected2 = false;
  bool selected3 = false;

  void changeSelect1() {
    setState(() {
      selected1 = !selected1;
    });
    if (selected1 == true) {
      selected2 = false;
      selected3 = false;
    }
  }

  void changeSelect2() {
    setState(() {
      selected2 = !selected2;
    });
    if (selected1 == true) {
      selected1 = false;
      selected3 = false;
    }
  }

  void changeSelect3() {
    setState(() {
      selected3 = !selected3;
    });
    if (selected3 == true) {
      selected1 = false;
      selected2 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(title: 'Checkout'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 2,
                  color: Colors.black26,
                ),
                const SizedBox(height: 20),
                Text(
                  'Delivery Address',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => GoRouter.of(context).push(AddressScreen.route),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF797979),
                        width: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Home',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                '28, Church street, Ikorodu Lagos Road, Lagos.',
                                style: Theme.of(context).textTheme.bodyMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PaymentMethodOption(
                      icon: Icons.credit_card,
                      title: 'Card',
                      onTap: changeSelect1,
                      isSelected: selected1,
                    ),
                    PaymentMethodOption(
                      icon: Icons.attach_money_rounded,
                      title: 'Cash',
                      onTap: changeSelect2,
                      isSelected: selected2,
                    ),
                    PaymentMethodOption(
                      icon: Icons.payments_outlined,
                      title: 'Pay',
                      onTap: changeSelect3,
                      isSelected: selected3,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () =>
                      GoRouter.of(context).push(PaymentMethodScreen.route),
                  child: const CreditCardContainer(
                    cardName: 'VISA',
                    cardDigits: '**** **** **** 1234',
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Order Summary',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 30),
                const SummaryLine(
                  leadingText: 'Sub-total',
                  trailingText: '₦5,870',
                ),
                const SizedBox(height: 20),
                const SummaryLine(
                  leadingText: 'VAT (%)',
                  trailingText: '₦5,870',
                ),
                const SizedBox(height: 20),
                const SummaryLine(
                  leadingText: 'Shipping fee',
                  trailingText: '₦5,870',
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 10),
                const SummaryLine(
                  leadingText: 'Total',
                  trailingText: '₦5,870',
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 52,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF797979),
                            width: 0.4,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Promo Code',
                              prefixIcon: Icon(Icons.sell_outlined),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        )),
                    Container(
                      height: 52,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFF797979),
                          width: 0.4,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Add',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Place Order'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
