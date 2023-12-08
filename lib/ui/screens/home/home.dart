import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/home/notification_screen.dart';
import 'package:demo_app/ui/screens/home/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home';
  static const String route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool selected1 = true;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  bool savedItem = false;

  void changeTab1() {
    setState(() {
      selected1 = !selected1;
    });
    if (selected1 == true) {
      selected2 = false;
      selected3 = false;
      selected4 = false;
    }
  }

  void changeTab2() {
    setState(() {
      selected2 = !selected2;
    });
    if (selected2 == true) {
      selected1 = false;
      selected3 = false;
      selected4 = false;
    }
  }

  void changeTab3() {
    setState(() {
      selected3 = !selected3;
    });
    if (selected3 == true) {
      selected1 = false;
      selected2 = false;
      selected4 = false;
    }
  }

  void changeTab4() {
    setState(() {
      selected4 = !selected4;
    });
    if (selected4 == true) {
      selected1 = false;
      selected2 = false;
      selected3 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discover',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  GestureDetector(
                      onTap: () =>
                          GoRouter.of(context).push(NotificationScreen.route),
                      child: const Icon(Icons.notifications_none_rounded))
                ],
              ),
              const SizedBox(height: 27),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 53,
                      child: Center(
                        child: StoreTextField(
                          hintText: 'Search anything',
                          prefixIcon: SizedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: SvgPicture.asset(
                                'assets/icons/search-icon.svg',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 53,
                    width: 53,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF000000),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/icons/filter-lines.svg'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TabbarItem(
                        onTap: () => changeTab1(),
                        title: 'All',
                        isSeleted: selected1,
                      ),
                      TabbarItem(
                        onTap: () => changeTab2(),
                        title: 'Men',
                        isSeleted: selected2,
                      ),
                      TabbarItem(
                        onTap: () => changeTab3(),
                        title: 'Women',
                        isSeleted: selected3,
                      ),
                      TabbarItem(
                        onTap: () => changeTab4(),
                        title: 'Kids',
                        isSeleted: selected4,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  height: 600,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(ProductDetailScreen.route);
                              },
                              child: ProductSale(
                                isSelected: savedItem,
                                onTap: () {
                                  setState(() {
                                    savedItem = !savedItem;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(ProductDetailScreen.route);
                              },
                              child: ProductSale(
                                isSelected: savedItem,
                                onTap: () {
                                  setState(() {
                                    savedItem = !savedItem;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(ProductDetailScreen.route);
                              },
                              child: ProductSale(
                                isSelected: savedItem,
                                onTap: () {
                                  setState(() {
                                    savedItem = !savedItem;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(ProductDetailScreen.route);
                              },
                              child: ProductSale(
                                isSelected: savedItem,
                                onTap: () {
                                  setState(() {
                                    savedItem = !savedItem;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(ProductDetailScreen.route);
                              },
                              child: ProductSale(
                                isSelected: savedItem,
                                onTap: () {
                                  setState(() {
                                    savedItem = !savedItem;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(ProductDetailScreen.route);
                              },
                              child: ProductSale(
                                isSelected: savedItem,
                                onTap: () {
                                  setState(() {
                                    savedItem = !savedItem;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabbarItem extends StatelessWidget {
  const TabbarItem({
    super.key,
    this.title,
    this.isSeleted,
    this.onTap,
  });

  final String? title;
  final bool? isSeleted;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: isSeleted == true
                ? const Color(0xFF000000)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: isSeleted == false
                ? Border.all(color: const Color(0xFF000000), width: 0.2)
                : null),
        child: Center(
          child: Text(
            '$title',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: isSeleted == true
                      ? Colors.white
                      : const Color(0xFF000000),
                ),
          ),
        ),
      ),
    );
  }
}
