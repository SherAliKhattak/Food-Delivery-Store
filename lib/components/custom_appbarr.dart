import 'package:flutter/material.dart';

class CustomAppBarr extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final Widget? trailing;
  const CustomAppBarr({
    super.key,
    this.title,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: leading,
          ),
          Padding(
            padding: trailing != null
                ? const EdgeInsets.all(0)
                : const EdgeInsets.only(right: 50),
            child: SizedBox(
              child: Text(
                title ?? '',
                style:
                     TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Theme.of(context).secondaryHeaderColor),
              ),
            ),
          ),
          SizedBox(
            child: trailing,
          )
        ],
      ),
    ));
  }
}
