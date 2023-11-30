import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class StoreTextField extends StatelessWidget {
  const StoreTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search anything',
        hintStyle: Theme.of(context).textTheme.displaySmall,
        prefixIcon: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset(
              'assets/icons/search-icon.svg',
            ),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 50,
          maxWidth: 50,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class StoreTextFormField extends StatelessWidget {
  const StoreTextFormField({
    super.key,
    this.hintText,
    this.obscureText = true,
    this.suffixIcon,
  });

  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF000000).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF000000).withOpacity(0.5),
              ),
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: const Color(0xFF000000).withOpacity(0.1))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: const Color(0xFF000000).withOpacity(0.1))),
        ),
      ),
    );
  }
}
