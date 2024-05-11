// ignore_for_file: prefer_final_fields
import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:demo_app/ui/screens/home/notification_screen.dart';
import 'package:demo_app/ui/screens/home/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home';
  static const String route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<bool> _savedItem;

  List<bool> _selections = [true, false, false, false];
  // late List<bool> _isSelected;
  late List foundItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final store = context.read<Store>();
    _savedItem = List.filled(store.productMenu.length, false);

    foundItems = store.productMenu;
  }

  void _saveItemToggle(int index) {
    setState(() {
      _savedItem[index] = !_savedItem[index];
      if (_savedItem[index] == true) {
        addToSavedItem(index);
      } else {
        removeFromSavedItem(index);
      }
    });
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

  void addToSavedItem(int index) {
    final store = context.read<Store>();
    store.addToSaved(store.productMenu[index]);
  }

  void removeFromSavedItem(int index) {
    final store = context.read<Store>();
    store.removeFromSaved(store.productMenu[index]);
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final store = context.read<Store>();
    final productMenu = store.productMenu;
    //
    return Scaffold(
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
                          child:
                              SvgPicture.asset('assets/icons/filter-lines.svg'),
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
                  Expanded(
                    child: GridView.builder(
                      itemCount: foundItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailScreen(
                                  product: foundItems[index],
                                  index: index,
                                );
                              },
                            ),
                          ),
                          child: ProductSale(
                            onTap: () {
                              _saveItemToggle(index);
                            },
                            isSelected: _savedItem[index],
                            product: foundItems[index],
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
          ),
        ),
      ),
    );
  }
}
