import 'package:demo_app/core/models/product.dart';
import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/home/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CartScreen extends StatefulWidget {
  static const String name = 'cart';
  static const String route = '/cart';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // late final Product product;
  // int index = 0;
  // int createIndex() {
  //   for (int _index = 0; _index < 5; _index++) {
  //     index = _index;
  //   }
  //   return index;
  // }

  @override
  Widget build(BuildContext context) {
    // final store = context.read<Store>();
    // final productMenu = store.productMenu;
    return Consumer<Store>(
      builder: (context, store, child) => Scaffold(
        appBar: const StoreAppBar(prefixIcon: SizedBox(), title: 'My Cart'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
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

                        final String productName = product.name;

                        final String productPrice = product.price;

                        return CartProductContainer(
                          product: product,
                          productName: productName,
                          productPrice: productPrice,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  store.cart.isEmpty
                      ? const SizedBox()
                      : CheckoutCalculator(
                          productStrPrice: store.cart[0].price),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CartProductContainer extends StatefulWidget {
  const CartProductContainer({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.product,
  });
  final Product product;
  final String productName;
  final String productPrice;

  @override
  State<CartProductContainer> createState() => _CartProductContainerState();
}

class _CartProductContainerState extends State<CartProductContainer> {
  void removeFromCart(Product product, BuildContext context) {
    final store = context.read<Store>();
    store.removeFromCart(product);
  }

  int quantity = 1;

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void increaseQuantity() {
    if (quantity < 5) {
      setState(() {
        quantity++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int productPrice = quantity * int.parse(widget.productPrice);
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF2F2F2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 79,
            width: 83,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF000000).withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              'assets/images/${widget.productName}.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.productName,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 14,
                          ),
                    ),
                    GestureDetector(
                      onTap: () => removeFromCart(widget.product, context),
                      child: SvgPicture.asset(
                        'assets/icons/delete-icon.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'SIZE L',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '# $productPrice',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        QuantitySelectionButton(
                          selectionType: '-',
                          onTap: () => decreaseQuantity(),
                        ),
                        const SizedBox(width: 10),
                        Text('$quantity'),
                        const SizedBox(width: 10),
                        QuantitySelectionButton(
                          selectionType: '+',
                          onTap: () => increaseQuantity(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutCalculator extends StatefulWidget {
  const CheckoutCalculator({
    super.key,
    required this.productStrPrice,
  });

  final String productStrPrice;

  @override
  State<CheckoutCalculator> createState() => _CheckoutCalculatorState();
}

class _CheckoutCalculatorState extends State<CheckoutCalculator> {
  late int productPrice = int.parse(widget.productStrPrice);

  int vatPrice = 100;
  int shippingPrice = 500;
  late int productTotalPrice = vatPrice + shippingPrice + productPrice;

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
          trailingText: '# $productPrice',
        ),
        const SizedBox(height: 20),
        SummaryLine(
          leadingText: 'VAT (%)',
          trailingText: '# $vatPrice',
        ),
        const SizedBox(height: 20),
        SummaryLine(
          leadingText: 'Shipping fee',
          trailingText: '# $shippingPrice',
        ),
        const SizedBox(height: 20),
        const Divider(
          height: 2,
        ),
        const SizedBox(height: 10),
        SummaryLine(
          leadingText: 'Total',
          trailingText: '# $productTotalPrice',
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 2,
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push(CheckoutScreen.route);
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
