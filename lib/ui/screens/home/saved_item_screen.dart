import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SavedItemScreen extends StatelessWidget {
  static const String name = 'saved-item';
  static const String route = '/saved-item';
  const SavedItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StoreAppBar(
                title: 'Saved Items',
              ),
              const SizedBox(height: 15),
              const Divider(
                height: 2,
                color: Colors.black26,
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 185),
                    SvgPicture.asset('assets/icons/big-heart.svg'),
                    const SizedBox(height: 5),
                    Text(
                      'No Saved Items!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'You don’t have any saved items. Go to home and add some.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
