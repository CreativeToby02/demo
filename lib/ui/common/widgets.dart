import 'package:demo_app/ui/screens/home/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: const Column(
        children: [
          Icon(Icons.arrow_back_outlined),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class StoreAppBar extends StatelessWidget {
  const StoreAppBar({
    super.key,
    this.title,
    this.icon,
  });
  final String? title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back_outlined)),
        Text(
          '$title',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        GestureDetector(
            onTap: () => GoRouter.of(context).push(NotificationScreen.route),
            child: icon ?? const Icon(Icons.notifications_none_outlined)),
      ],
    );
  }
}

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    super.key,
    this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black.withOpacity(0.4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/logos_google-icon.svg'),
          const SizedBox(width: 10),
          Text('$title', style: Theme.of(context).textTheme.displaySmall)
        ],
      ),
    );
  }
}

class ProductSale extends StatelessWidget {
  const ProductSale({
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
            height: 174,
            width: 161,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/image 1.png'),
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 35,
                    width: 35,
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
          const SizedBox(height: 10),
          Text(
            'Regular fit slogan',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text('PKR 1,190', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
