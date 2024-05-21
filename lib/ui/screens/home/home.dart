// ignore_for_file: prefer_final_fields
import 'package:demo_app/core/firebase_services/get_products.dart';
import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/home/notification_screen.dart';
import 'package:demo_app/ui/screens/home/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home';
  static const String route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> _selections = [true, false, false, false];

  late List foundItems = [];

  List<String> docIDs = [];

  Future getProductsDocuments() async {
    await FirebaseFirestore.instance.collection('products').get().then(
          // ignore: avoid_function_literals_in_foreach_calls
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    final store = context.read<Store>();
    foundItems = store.productMenu;
  }

  void _runSearch(String keyword) {
    final store = context.read<Store>();
    List results = [];
    if (keyword.isEmpty) {
      results = store.productMenu;
    } else {
      results = store.productMenu
          .where((product) =>
              product.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundItems = results;
    });
  }

  void _updateSelection(int index) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < _selections.length;
          buttonIndex++) {
        _selections[buttonIndex] = buttonIndex == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Consumer<Store>(
      builder: (context, store, child) => Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.white,
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discover',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        GestureDetector(
                            onTap: () => GoRouter.of(context)
                                .push(NotificationScreen.route),
                            child: const Icon(Icons.notifications_none_rounded))
                      ],
                    ),
                  ],
                ),
              ),
            ],
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 53,
                            child: Center(
                              child: StoreTextField(
                                onChanged: (value) => _runSearch(value),
                                hintText: 'Search anything',
                                prefixIcon: SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
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
                            child: SvgPicture.asset(
                                'assets/icons/filter-lines.svg'),
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
                            for (int index = 0;
                                index < _selections.length;
                                index++)
                              TabbarItem(
                                onTap: () => _updateSelection(index),
                                title: index == 0
                                    ? "All"
                                    : (index == 1
                                        ? "Men"
                                        : (index == 2 ? "Women" : "Kids")),
                                isSeleted: _selections[index],
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Expanded(
                    //   child: GridView.builder(
                    //     itemCount: foundItems.length,
                    //     itemBuilder: (context, index) {
                    //       return GestureDetector(
                    //         onTap: () => Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) {
                    //               return ProductDetailScreen(
                    //                 product: foundItems[index],
                    //                 index: index,
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //         child: ProductSale(
                    //           savedOnTap: () {
                    //             setState(() {
                    //               store.productMenu[index].isLiked =
                    //                   !store.productMenu[index].isLiked;
                    //               if (store.productMenu[index].isLiked ==
                    //                   true) {
                    //                 store.addToSavedItem(
                    //                     store.productMenu[index]);
                    //               } else {
                    //                 store.removeFromSavedItem(
                    //                     store.productMenu[index]);
                    //               }
                    //             });
                    //           },
                    //           // isSelected: _savedItem[index],
                    //           product: foundItems[index],
                    //         ),
                    //       );
                    //     },
                    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2,
                    //         mainAxisSpacing: 0,
                    //         childAspectRatio:
                    //             MediaQuery.of(context).size.width / 2 / 280),
                    //   ),
                    // ),
                    // Expanded(
                    //   child: FutureBuilder(
                    //       future: getProductsDocuments(),
                    //       builder: (context, snapshot) {
                    //         return ListView.builder(
                    //           itemCount: docIDs.length,
                    //           itemBuilder: (context, index) {
                    //             return ListTile(
                    //               title: ProductName(
                    //                 documentId: docIDs[index],
                    //               ),
                    //             );
                    //           },
                    //         );
                    //       }),
                    // ),
                    // Expanded(
                    //   child: FutureBuilder(
                    //     future: getProductsDocuments(),
                    //     builder: (context, snapshot) {
                    //       return ListView.builder(
                    //         itemCount: docIDs.length,
                    //         itemBuilder: (context, index) {
                    //           CollectionReference products = FirebaseFirestore
                    //               .instance
                    //               .collection('products');
                    //           return FutureBuilder<DocumentSnapshot>(
                    //             future: products.doc(docIDs[index]).get(),
                    //             builder: (context, snapshot) {
                    //               if (snapshot.connectionState ==
                    //                   ConnectionState.done) {
                    //                 Map<String, dynamic> data = snapshot.data!
                    //                     .data() as Map<String, dynamic>;
                    //                 return ListTile(
                    //                   title: Text('${data['name']}'),
                    //                 );
                    //               }
                    //               return const Text('Loading...');
                    //             },
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),

                    Expanded(
                      child: FutureBuilder(
                        future: getProductsDocuments(),
                        builder: (context, snapshot) {
                          return GridView.builder(
                            itemCount: docIDs.length,
                            itemBuilder: (context, index) {
                              CollectionReference products = FirebaseFirestore
                                  .instance
                                  .collection('products');
                              return FutureBuilder<DocumentSnapshot>(
                                future: products.doc(docIDs[index]).get(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    Map<String, dynamic> data = snapshot.data!
                                        .data() as Map<String, dynamic>;
                                    return GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return ProductDetailScreen(
                                              product: foundItems[index],
                                              index: index,
                                              productName: data['name'],
                                              price: data['price'].toString(),
                                              imagePath: data['imagePath'],
                                              rating: data['rating'],
                                              isLiked: !data['isLiked'],
                                            );
                                          },
                                        ),
                                      ),
                                      child: ProductSale(
                                        savedOnTap: () {
                                          // setState(() {
                                          // data['isLiked'] = !data['isLiked'];
                                          //   store.productMenu[index].isLiked =
                                          //       !store
                                          //           .productMenu[index].isLiked;
                                          //   if (store.productMenu[index]
                                          //           .isLiked ==
                                          //       true) {
                                          //     store.addToSavedItem(
                                          //         store.productMenu[index]);
                                          //   } else {
                                          //     store.removeFromSavedItem(
                                          //         store.productMenu[index]);
                                          //   }
                                          // });
                                        },
                                        name: data['name'],
                                        price: data['price'].toString(),
                                        imagePath: data['imagePath'],
                                        rating: data['rating'],
                                        isLiked: !data['isLiked'],
                                      ),
                                    );
                                  }
                                  return const Text('Loading...');
                                },
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 0,
                                    childAspectRatio:
                                        MediaQuery.of(context).size.width /
                                            2 /
                                            280),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
