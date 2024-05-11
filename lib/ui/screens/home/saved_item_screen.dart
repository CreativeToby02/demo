import 'package:demo_app/core/models/store.dart';
import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SavedItemScreen extends StatefulWidget {
  static const String name = 'saved-item';
  static const String route = '/saved-item';
  const SavedItemScreen({super.key});

  @override
  State<SavedItemScreen> createState() => _SavedItemScreenState();
}

class _SavedItemScreenState extends State<SavedItemScreen> {
  late List<bool> _savedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final store = context.read<Store>();
    _savedItem = List.filled(store.savedItem.length, true);
  }

  void _saveItemToggle(int index) {
    setState(() {
      _savedItem[index] = !_savedItem[index];
      if (_savedItem[index] == false) {
        removeFromSavedItem(index);
      } else {
        addToSavedItem(index);
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
    return Consumer<Store>(
      builder: (context, store, child) => Scaffold(
        appBar: const StoreAppBar(prefixIcon: SizedBox(), title: 'Saved Items'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 2,
                  color: Colors.black26,
                ),
                const SizedBox(height: 20),
                // EmptySavedItem(),
                Expanded(
                  child: GridView.builder(
                    itemCount: store.savedItem.length,
                    itemBuilder: (context, index) {
                      return ProductSale(
                        onTap: () {
                          _saveItemToggle(index);
                        },
                        isSelected: _savedItem[index],
                        product: store.savedItem[index],
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
    );
  }
}

class EmptySavedItem extends StatelessWidget {
  const EmptySavedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
