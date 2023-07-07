
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularBackButton extends StatelessWidget {
  final Color borderColor;
  final Color iconColor;
  const CircularBackButton({
    super.key, this.borderColor = Colors.black,  this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*.035,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor,width: 2),
      ),
      child: IconButton(
        splashRadius: 15,
        padding:EdgeInsets.zero,
        onPressed: (){Get.back();},
        icon:  Icon(Icons.arrow_back,size: 20,color: iconColor,),
      ),
    );
  }
}