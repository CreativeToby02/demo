import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/bottom_modal_sheets.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String name = 'address';
  static const String route = '/address';
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    //
    final store = context.read<Store>();
    //
    return Scaffold(
      appBar: const StoreAppBar(
        title: 'Address',
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
                const SizedBox(height: 20),
                Text(
                  'Saved Address',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: store.addressItem.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AddressContainer(
                        addressName: store.addressItem[index].addressName,
                        addressFullName:
                            store.addressItem[index].addressFullname,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const AddAddressBottomSheet();
                      }),
                  child: Container(
                    height: 50,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_forward_rounded),
                        const SizedBox(width: 10),
                        Text(
                          'Add New Address',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Apply'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    this.addressName,
    this.addressFullName,
  });

  final String? addressName;
  final String? addressFullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF797979),
          width: 0.4,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$addressName',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      '$addressFullName',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(overflow: TextOverflow.fade),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Icons.radio_button_checked),
        ],
      ),
    );
  }
}
