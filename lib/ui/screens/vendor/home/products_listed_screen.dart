import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/home/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsListedScreen extends StatefulWidget {
  static const String name = 'products-listed';
  static const String route = '/products-listed';
  const ProductsListedScreen({super.key});

  @override
  State<ProductsListedScreen> createState() => _ProductsListedScreenState();
}

class _ProductsListedScreenState extends State<ProductsListedScreen> {
  @override
  Widget build(BuildContext context) {
    //
    final store = context.read<Store>();
    final productMenu = store.productMenu;
    //
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Products Listed',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                itemCount: productMenu.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailScreen(
                            product: productMenu[index],
                            index: index,
                          );
                        },
                      ),
                    ),
                    child: ProductSale(
                      product: productMenu[index],
                      defaultRating: '0.0',
                      starIconColor: Colors.grey.shade400,
                      defaultAssetImage:
                          const AssetImage('assets/images/cloth.png'),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    childAspectRatio:
                        MediaQuery.of(context).size.width / 2 / 280),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
