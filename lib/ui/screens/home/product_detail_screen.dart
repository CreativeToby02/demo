// ignore_for_file: deprecated_member_use
import 'package:demo_app/ui/screens/home/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String name = 'product-detail';
  static const String route = '/product-detail';
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 58,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price', style: Theme.of(context).textTheme.bodyLarge),
                    Text(
                      'PKR 1,190',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 24),
                    ),
                  ],
                ),
                Container(
                  height: 58,
                  width: 191,
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
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StoreAppBar(
                  title: 'Details',
                ),
                const SizedBox(height: 15),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                const ProductSaleDetail(),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Regular fit slogan',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () =>
                          GoRouter.of(context).push(ReviewScreen.route),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFA928),
                          ),
                          const SizedBox(width: 6),
                          Text('4.5/5 (45 reviews)',
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
                        SizeOption(
                          size: 'S',
                        ),
                        SizeOption(
                          size: 'M',
                        ),
                        SizeOption(
                          size: 'L',
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text('Price',
                    //             style: Theme.of(context).textTheme.bodyLarge),
                    //         Text(
                    //           'PKR 1,190',
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .displayMedium
                    //               ?.copyWith(fontSize: 24),
                    //         ),
                    //       ],
                    //     ),
                    //     Container(
                    //       height: 58,
                    //       width: 191,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color: const Color(0xFF000000)),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           SvgPicture.asset(
                    //             'assets/icons/shopping-bag.svg',
                    //             color: const Color(0xFFFFFFFF),
                    //           ),
                    //           const SizedBox(width: 10),
                    //           Text('Add to cart',
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .displaySmall
                    //                   ?.copyWith(
                    //                       color: const Color(0xFFFFFFFF))),
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // )
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

class SizeOption extends StatelessWidget {
  const SizeOption({
    super.key,
    this.size,
  });
  final String? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 33,
      margin: const EdgeInsets.only(right: 25, left: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.3,
        ),
      ),
      child: Center(
        child: Text(
          '$size',
          style:
              Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20),
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
  });
  final bool? isSelected;
  final Function()? onTap;

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
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/image 1.png'),
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
