import 'package:flutter/material.dart';

class StoreTextField extends StatelessWidget {
  const StoreTextField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.controller,
    this.errorText,
    this.validator,
  });

  final Widget? prefixIcon, suffixIcon;
  final String? hintText, errorText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: validator,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: const Color(0xFF000000).withOpacity(0.1))),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF000000).withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: Theme.of(context).textTheme.displaySmall,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
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
      ),
    );
  }
}

class StoreTextFormField extends StatelessWidget {
  const StoreTextFormField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.controller,
    this.errorText,
    this.validator,
  });

  final String? hintText, errorText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF000000).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          keyboardType: keyboardType,
          validator: validator,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: const Color(0xFF000000).withOpacity(0.1))),
            errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color(0xFF000000).withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10),
            ),
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
      ),
    );
  }
}

class StorePasswordFormField extends StatelessWidget {
  const StorePasswordFormField({
    super.key,
    this.hintText,
    this.obscureText = true,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.controller,
    this.errorText,
    this.validator,
  });

  final String? hintText, errorText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF000000).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: validator,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: const Color(0xFF000000).withOpacity(0.1))),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF000000).withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),
          ),
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
