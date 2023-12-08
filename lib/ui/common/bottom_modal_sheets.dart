import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/screens/home/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddAddressBottomSheet extends StatefulWidget {
  const AddAddressBottomSheet({
    super.key,
  });

  @override
  State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();
}

class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Congratulations!',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your new address has been added',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(CheckoutScreen.route);
                    },
                    child: const Text('Thanks'))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Address Nickname',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const StoreTextFormField(),
            const SizedBox(height: 20),
            Text(
              'Full Address',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const StoreTextFormField(),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                    value: true,
                    activeColor: Colors.black,
                    onChanged: (value) {}),
                Text(
                  'Make this as a default address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _showAlertDialog();
              },
              child: const Text('Add'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
