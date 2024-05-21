// ignore_for_file: unused_element
import 'package:demo_app/core/models/product.dart';
import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/home/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String name = 'cart';
  static const String route = '/cart';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final store = context.read<Store>();
      store.calculateSubTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
      builder: (context, store, child) => Scaffold(
        appBar: const StoreAppBar(prefixIcon: SizedBox(), title: 'My Cart'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                children: [
                  const Divider(
                    height: 2,
                    color: Colors.black26,
                  ),
                  const SizedBox(height: 20),
                  store.cart.isEmpty
                      ? const EmptyCartDialog()
                      : const SizedBox(),
                  SizedBox(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: store.cart.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final Product product = store.cart[index];
                        return CartProductContainer(
                          product: product,
                          deleteOnTap: () {
                            store.removeFromCart(product);
                            setState(() {
                              store.calculateSubTotal();
                            });
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  store.cart.isEmpty
                      ? const SizedBox()
                      : CheckoutCalculator(
                          productPrice: store.totalPrice,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckoutCalculator extends StatefulWidget {
  const CheckoutCalculator({
    super.key,
    required this.productPrice,
  });

  final int productPrice;

  @override
  State<CheckoutCalculator> createState() => _CheckoutCalculatorState();
}

class _CheckoutCalculatorState extends State<CheckoutCalculator> {
  int vatPrice = 100;
  int shippingPrice = 500;

  int addTotalPrice() {
    return vatPrice + shippingPrice + widget.productPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            'Add Voucher',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 30),
        SummaryLine(
          leadingText: 'Sub-total',
          trailingText: '₦${widget.productPrice}',
        ),
        const SizedBox(height: 20),
        SummaryLine(
          leadingText: 'VAT (%)',
          trailingText: '₦$vatPrice',
        ),
        const SizedBox(height: 20),
        SummaryLine(
          leadingText: 'Shipping fee',
          trailingText: '₦$shippingPrice',
        ),
        const SizedBox(height: 20),
        const Divider(
          height: 2,
        ),
        const SizedBox(height: 10),
        SummaryLine(
          leadingText: 'Total',
          trailingText: '₦${addTotalPrice()}',
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 2,
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CheckoutScreen(
                subTotal: widget.productPrice,
                vat: vatPrice,
                shippingFee: shippingPrice,
                totalPrice: addTotalPrice(),
              );
            }));
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Checkout'),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward_rounded),
            ],
          ),
        ),
      ],
    );
  }
}
