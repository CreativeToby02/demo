import 'package:demo_app/core/models/credit_card.dart';
import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/alert_dailog_widgets.dart';
import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewCardScreen extends StatefulWidget {
  static const String name = 'add-new-card';
  static const String route = '/add-new-card';
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const AddNewCardAlertDialog();
        });
  }

  final _cardName = TextEditingController();
  final _cardDigits = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cardDigits.dispose();
    _cardName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(
        title: 'New Card',
        icon: SizedBox(),
      ),
      body: Consumer<Store>(
        builder: (context, store, child) => SafeArea(
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
                    'Add Debit or Credit Card',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Card number',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 53,
                    child: StoreTextField(
                      hintText: '**** **** **** 1234',
                      controller: _cardDigits,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expiry Date',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            const SizedBox(
                              height: 53,
                              width: 180,
                              child: StoreTextField(
                                hintText: '10/23',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Security Code',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            const SizedBox(
                              height: 53,
                              width: 180,
                              child: StoreTextField(
                                hintText: '123',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_cardName.text.isNotEmpty &&
                            _cardDigits.text.isNotEmpty) {
                          store.addToCreditCard(
                            CreditCard(
                              cardName: _cardName.text,
                              cardDigits: _cardDigits.text,
                            ),
                          );
                          _showAlertDialog();
                        }
                      },
                      child: const Text('Apply'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
