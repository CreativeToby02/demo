import 'package:demo_app/core/models/address.dart';
import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddAddressBottomSheet extends StatefulWidget {
  const AddAddressBottomSheet({
    super.key,
  });

  @override
  State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();
}

class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  void addToAddress(Address address) {
    final store = context.read<Store>();
    store.addToAddress(address);
  }

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
                      context.pop();

                      context.pop();
                    },
                    child: const Text('Thanks'))
              ],
            ),
          );
        });
  }

  final _addressNickname = TextEditingController();
  final _addressFullname = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _addressFullname.dispose();
    _addressNickname.dispose();
  }

  bool active = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          StoreTextFormField(
            controller: _addressNickname,
          ),
          const SizedBox(height: 20),
          Text(
            'Full Address',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          StoreTextFormField(
            controller: _addressFullname,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                  value: active,
                  activeColor: Colors.black,
                  onChanged: (value) {
                    active = value!;
                  }),
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
              if (_addressNickname.text.isNotEmpty &&
                  _addressFullname.text.isNotEmpty) {
                addToAddress(
                  Address(
                    addressName: _addressNickname.text,
                    addressFullname: _addressFullname.text,
                  ),
                );
                _showAlertDialog();
              }
            },
            child: const Text('Add'),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
