import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SearchScreen extends StatefulWidget {
  static const String name = 'search';
  static const String route = '/search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List _foundItems = [];

  @override
  void initState() {
    super.initState();
    final store = context.read<Store>();
    _foundItems = store.productMenu;
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
      _foundItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
      builder: (context, store, child) => Scaffold(
        appBar: const StoreAppBar(prefixIcon: SizedBox(), title: 'Search'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 53,
                    child: StoreTextField(
                      hintText: 'Search anything',
                      onChanged: (value) {
                        _runSearch(value);
                      },
                      prefixIcon: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SvgPicture.asset(
                            'assets/icons/search-icon.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Searches',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Column(
                        children: [
                          Text(
                            'Clear all',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    decoration: TextDecoration.underline),
                          ),
                          const Divider(height: 10),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  ListView.builder(
                    itemCount: _foundItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 72,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/rec-background.png'))),
                        child: ListTile(
                          title: Row(
                            children: [
                              const SizedBox(width: 20),
                              Text(
                                "${_foundItems[index].name}",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              const SizedBox(width: 20),
                              Text(
                                '₦${_foundItems[index].price}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.close,
                              size: 20,
                            ),
                          ),
                        ),
                      );
                    },
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
