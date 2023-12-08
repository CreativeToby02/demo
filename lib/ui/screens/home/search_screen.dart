import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SearchScreen extends StatelessWidget {
  static const String name = 'search';
  static const String route = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(prefixIcon: SizedBox(), title: 'Search'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 53,
                child: StoreTextField(
                  hintText: 'Search anything',
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
                            ?.copyWith(decoration: TextDecoration.underline),
                      ),
                      const Divider(height: 10),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
