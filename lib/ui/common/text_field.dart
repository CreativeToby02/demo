import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          hintStyle: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(color: Colors.black38),
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
                borderSide: BorderSide(
                    color: const Color(0xFF000000).withOpacity(0.1))),
            errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color(0xFF000000).withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black38,
                ),
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: const Color(0xFF000000).withOpacity(0.1))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: const Color(0xFF000000).withOpacity(0.1))),
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
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.black38),
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

class DatePickerField extends StatefulWidget {
  const DatePickerField({
    super.key,
    required this.dateInput,
    this.onChange,
    this.readOnly = false,
  });
  final TextEditingController dateInput;
  final Function(String)? onChange;
  final bool readOnly;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  @override
  dispose() {
    widget.dateInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 50,
      width: size.width * 0.4,
      child: TextFormField(
        controller: widget.dateInput,
        validator: (txt) {
          if (txt!.isEmpty) {
            return 'Please select your preferred date.';
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: const SizedBox(
            child: Icon(Icons.date_range_rounded),
          ),
          labelText: "DD/MM/YY",
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFFD9D9D9),
              fontSize: 13),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9C9999), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9C9999), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
        readOnly: true,
        onTap: widget.readOnly
            ? null
            : () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  setState(() {
                    widget.dateInput.text = formattedDate;
                  });
                  if (widget.onChange == null) return;
                  widget.onChange!(formattedDate);
                }
              },
      ),
    );
  }
}
