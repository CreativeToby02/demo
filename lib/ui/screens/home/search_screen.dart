import 'package:demo_app/ui/common/text_field.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const String name = 'search';
  static const String route = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const StoreAppBar(
                title: 'Search',
              ),
              const SizedBox(height: 20),
              const StoreTextField(),
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
