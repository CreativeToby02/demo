import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CartScreen extends StatelessWidget {
  static const String name = 'cart';
  static const String route = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StoreAppBar(
                  title: 'My Cart',
                ),
                const SizedBox(height: 15),
                const Divider(
                  height: 2,
                  color: Colors.black26,
                ),
                const SizedBox(height: 20),
                // EmptyCartDialog(),
                const CartProductContainer(),
                const CartProductContainer(),
                const SizedBox(height: 20),
                Container(
                  height: 55,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
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
                const SummaryLine(
                  leadingText: 'Sub-total',
                  trailingText: 'PKR 5,870',
                ),
                const SizedBox(height: 30),
                const SummaryLine(
                  leadingText: 'VAT (%)',
                  trailingText: 'PKR 5,870',
                ),
                const SizedBox(height: 30),
                const SummaryLine(
                  leadingText: 'Shipping fee',
                  trailingText: 'PKR 5,870',
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 20),
                const SummaryLine(
                  leadingText: 'Total',
                  trailingText: 'PKR 5,870',
                ),
                const SizedBox(height: 20),
                const Divider(
                  height: 2,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Checkout'),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_rounded),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyCartDialog extends StatelessWidget {
  const EmptyCartDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 185),
          SvgPicture.asset('assets/icons/big-heart.svg'),
          const SizedBox(height: 5),
          Text(
            'Your Cart is Empty',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 5),
          Text(
            'When you add products, they’ll appear here.',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }
}

class CartProductContainer extends StatelessWidget {
  const CartProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset('assets/images/image 1.png'),
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
                      'REGULAR FIT SLOGAN',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 14,
                          ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/delete-icon.svg',
                      height: 20,
                      width: 20,
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
                      'PKR 1,100',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const Row(
                      children: [
                        QuantitySelectionButton(
                          selectionType: '-',
                        ),
                        SizedBox(width: 10),
                        Text('2'),
                        SizedBox(width: 10),
                        QuantitySelectionButton(
                          selectionType: '+',
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

class SummaryLine extends StatelessWidget {
  const SummaryLine({
    super.key,
    this.leadingText,
    this.trailingText,
  });
  final String? leadingText, trailingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$leadingText',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text('$trailingText',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class QuantitySelectionButton extends StatelessWidget {
  const QuantitySelectionButton({
    super.key,
    this.selectionType,
  });
  final String? selectionType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF000000).withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          '$selectionType',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
