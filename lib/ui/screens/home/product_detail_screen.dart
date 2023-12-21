// ignore_for_file: deprecated_member_use
import 'package:demo_app/core/models/product.dart';
import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/screens/home/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String name = 'product-detail';
  static const String route = '/product-detail';
  const ProductDetailScreen(
      {super.key, required this.product, required this.index});

  final Product product;
  final int index;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  void addToCart() {
    final store = context.read<Store>();
    if (store.cart.contains(store.productMenu[widget.index])) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: const Text('Item is already added to cart'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done),
            ),
          ],
        ),
      );
    } else {
      store.addToCart(widget.product);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: const Text('Successfully added to cart'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(
        title: 'Details',
        icon: SizedBox(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 58,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price',
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text(
                        '# ${widget.product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 24),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                MaterialButton(
                  onPressed: () => addToCart(),
                  child: Container(
                    height: 58,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF000000)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/shopping-bag.svg',
                          color: const Color(0xFFFFFFFF),
                        ),
                        const SizedBox(width: 10),
                        Text('Add to cart',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: const Color(0xFFFFFFFF))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                ProductSaleDetail(
                  productImage: widget.product.imagePath,
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ReviewScreen(
                            productRating: widget.product.rating);
                      })),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFA928),
                          ),
                          const SizedBox(width: 6),
                          Text('${widget.product.rating}/5 (45 reviews)',
                              style: Theme.of(context).textTheme.displaySmall),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                        'The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 20),
                    Text(
                      'Choose size',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        ProductSizeOption(
                          size: 'S',
                        ),
                        ProductSizeOption(
                          size: 'M',
                        ),
                        ProductSizeOption(
                          size: 'L',
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductSaleDetail extends StatelessWidget {
  const ProductSaleDetail({
    super.key,
    this.isSelected,
    this.onTap,
    required this.productImage,
  });
  final bool? isSelected;
  final Function()? onTap;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/$productImage.png'),
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: isSelected == true
                          ? SvgPicture.asset('assets/icons/red-heart.svg')
                          : SvgPicture.asset('assets/icons/favorite-icon.svg'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
