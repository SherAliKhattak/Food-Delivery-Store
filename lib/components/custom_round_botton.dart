
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRoundButton extends StatelessWidget {
  final String title;
  final EdgeInsets? margin;
  final double? height;
  final Color? buttonColor;
  final Function()? onPresse;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  const CustomRoundButton({
    super.key, required this.title, this.onPresse, this.margin, this.buttonColor, this.textColor, this.padding, this.height,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(onTap: onPresse,
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        margin:margin?? const EdgeInsets.symmetric(horizontal: 20),
        height: height ?? Get.height * .07,
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor ?? const Color(0xff2DC0BE),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
          title,
          style:  TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color:textColor ?? const Color(0xffFFFFFF)),
        )),
      ),
    );
  }
}
