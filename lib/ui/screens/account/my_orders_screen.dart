import 'package:demo_app/ui/common/widgets.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  static const String name = 'my-orders';
  static const String route = '/my-orders';
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  bool selected1 = true;
  bool selected2 = false;

  void change1() {
    setState(() {
      selected1 = !selected1;
    });
    if (selected1 == true) {
      selected2 = false;
    }
  }

  void change2() {
    setState(() {
      selected2 = !selected2;
    });
    if (selected2 == true) {
      selected1 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(title: 'My Orders'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.black,
                ),
                const SizedBox(height: 20),
                MyOrderTabBar(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: change1,
                          child: MyOrderTabOption(
                            title: 'Ongoing',
                            isSelected: selected1,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: change2,
                          child: MyOrderTabOption(
                            title: 'Completed',
                            isSelected: selected2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                selected1 == true
                    ? const Column(
                        children: [
                          OngoingOrderContainer(),
                          OngoingOrderContainer(),
                          OngoingOrderContainer(),
                          OngoingOrderContainer(),
                        ],
                      )
                    : const SizedBox(),
                selected2 == true
                    ? const Column(
                        children: [
                          CompletedOrderContainer(),
                          CompletedOrderContainer(),
                          CompletedOrderContainer(),
                          CompletedOrderContainer(),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyOrderTabBar extends StatelessWidget {
  const MyOrderTabBar({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFC7C7C7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

class MyOrderTabOption extends StatelessWidget {
  const MyOrderTabOption({
    super.key,
    this.title,
    this.isSelected = true,
  });
  final String? title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 158,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFFFFFF) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          '$title',
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w800, fontSize: 14),
        ),
      ),
    );
  }
}

class OngoingOrderContainer extends StatelessWidget {
  const OngoingOrderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF000000).withOpacity(0.4),
        ),
        color: const Color(0xFFFFFFFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 79,
            width: 83,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF000000).withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/image 1.png'),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'REGULAR FIT SLOGAN',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 20,
                      width: 58,
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text('In Transit',
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'SIZE L',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PKR 1,100',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 20,
                      width: 78,
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Track Order',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedOrderContainer extends StatelessWidget {
  const CompletedOrderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF000000).withOpacity(0.4),
        ),
        color: const Color(0xFFFFFFFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 79,
            width: 83,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF000000).withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/image 1.png'),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'REGULAR FIT SLOGAN',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 20,
                      width: 68,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Completed',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'SIZE L',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PKR 1,100',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 20,
                      width: 84,
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Leave Review',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
