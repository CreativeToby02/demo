import 'package:demo_app/core/models/product.dart';
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

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppBar({
    required this.title,
    this.end,
    super.key,
    this.icon,
    this.prefixIcon,
  });
  final Widget? icon, prefixIcon;
  final String title;
  final Widget? end;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          prefixIcon ??
              GestureDetector(
                onTap: () => context.pop(),
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_outlined,
                      size: 25.0,
                    ),
                  ],
                ),
              ),
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          GestureDetector(
              onTap: () => GoRouter.of(context).push(NotificationScreen.route),
              child: icon ?? const Icon(Icons.notifications_none_outlined)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    super.key,
    this.title,
    this.onTap,
  });
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}

class ProductSale extends StatelessWidget {
  const ProductSale({
    super.key,
    this.isSelected,
    this.onTap,
    this.productName,
    required this.product,
    this.icon,
    this.defaultRating,
    this.starIconColor,
    this.defaultAssetImage,
  });
  final bool? isSelected;
  final Function()? onTap;
  final String? productName;
  final Product product;
  final Widget? icon;
  final String? defaultRating;
  final Color? starIconColor;
  final ImageProvider<Object>? defaultAssetImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      // width: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 174,
              width: 161,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: defaultAssetImage ??
                      AssetImage('assets/images/${product.imagePath}.png'),
                ),
              ),
              child: icon ??
                  Align(
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
                                : SvgPicture.asset(
                                    'assets/icons/favorite-icon.svg'),
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '₦${product.price}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: starIconColor ?? Colors.yellow.shade600,
                    ),
                    Text(
                      defaultRating ?? product.rating,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryLine extends StatelessWidget {
  const SummaryLine({
    super.key,
    this.leadingText,
    this.trailingText,
  });
  final String? leadingText, trailingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$leadingText',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text('$trailingText',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class AccountOptions extends StatelessWidget {
  const AccountOptions({
    super.key,
    this.optionType,
    this.icon,
    this.onPressed,
  });
  final String? optionType;
  final IconData? icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 22, right: 22, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 20),
                Text(
                  '$optionType',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}

class EmptyCartDialog extends StatelessWidget {
  const EmptyCartDialog({
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
            'Your Cart is Empty',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 5),
          Text(
            'When you add products, they’ll appear here.',
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

class ProductSizeOption extends StatelessWidget {
  const ProductSizeOption({
    super.key,
    this.size,
  });
  final String? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 33,
      margin: const EdgeInsets.only(right: 25, left: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.3,
        ),
      ),
      child: Center(
        child: Text(
          '$size',
          style:
              Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}

class QuantitySelectionButton extends StatelessWidget {
  const QuantitySelectionButton({
    super.key,
    this.selectionType,
    this.onTap,
  });
  final String? selectionType;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF000000).withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            '$selectionType',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class CreditCardContainer extends StatelessWidget {
  const CreditCardContainer({
    super.key,
    this.cardName,
    this.cardDigits,
  });

  final String? cardName;
  final String? cardDigits;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF797979),
          width: 0.4,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '$cardName',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              Text(
                '$cardDigits',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
              )
            ],
          ),
          const Icon(Icons.mode_edit_outlined)
        ],
      ),
    );
  }
}

class PaymentMethodOption extends StatelessWidget {
  const PaymentMethodOption({
    super.key,
    this.icon,
    this.title,
    this.onTap,
    this.isSelected,
  });

  final IconData? icon;
  final String? title;
  final Function()? onTap;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          color: isSelected == true ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isSelected == false
              ? Border.all(
                  color: const Color(0xFF797979),
                  width: 0.4,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected == true ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 10),
            Text(
              '$title',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isSelected == true ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
