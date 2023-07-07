import 'package:flutter/material.dart';
import 'package:store_app/utils/light_them.dart';

class CustomRoundTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final Widget? suffixIcon;
  const CustomRoundTextfield({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).secondaryHeaderColor),
        validator: validator,
        controller: controller,
        cursorColor: kprimaryColor,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).secondaryHeaderColor),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kprimaryColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kprimaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kprimaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20)),
      ),
    );
  }
}
