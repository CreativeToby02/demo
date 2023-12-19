import 'package:demo_app/core/models/product.dart';
import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  static const String name = 'add-product';
  static const String route = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  void addToProduct(product) {
    final store = context.read<Store>();
    store.addToProduct(product);
  }

  final _productName = TextEditingController();
  final _productPrice = TextEditingController();
  final _productImage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(
        title: 'Add New Product',
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
                  'Product Name',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 53,
                  child: StoreTextField(
                    hintText: 'Enter product name',
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Product Price',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 53,
                  child: StoreTextField(
                    hintText: 'Enter product price',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Product Image Name',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 53,
                  child: StoreTextField(
                    hintText: 'Same as product name',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    addToProduct(
                      Product(
                          name: _productName.text,
                          price: _productPrice.text,
                          imagePath: _productImage.text,
                          rating: ''),
                    );
                  },
                  child: const Text('Add Product'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
