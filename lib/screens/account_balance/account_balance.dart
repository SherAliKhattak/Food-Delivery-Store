import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/circular_back_botton.dart';
import 'package:store_app/components/custom_appbarr.dart';
import 'package:store_app/components/custom_round_botton.dart';
import 'package:store_app/components/snackbars.dart';
import 'package:store_app/utils/light_them.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  PreferredSize(preferredSize: const Size.fromHeight(100),
      child: CustomAppBarr(leading: const CircularBackButton(),title: 'accountbalance'.tr,)),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Container(
              padding:const  EdgeInsets.all(20),
              height: Get.height*0.28,
              width: Get.width*0.9,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kprimaryColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('accountbalance'.tr,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: kwhiteContainer,fontSize: 25),),
                  SizedBox(height: Get.height*0.04,),
                  Text(' \$  0.00',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: kwhiteContainer,fontSize: 35),),
                 const  Spacer(),
                   CustomRoundButton(
                    onPresse: () {
                      showSnackbar(context: context, content: 'you dont have any balance to withdraw',color: Colors.green);
                    },
                    title: 'withdraw'.tr,buttonColor: kwhiteContainer,textColor: kprimaryColor,margin:const EdgeInsets.symmetric(horizontal: 70),height: Get.height*0.04,),
                 
                ],

              ),
            ),

            SizedBox(height: Get.height*0.05,),
            Text('withdrawalmethods'.tr,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).secondaryHeaderColor,fontSize: 20),),
            SizedBox(height: Get.height*0.03,),
             Text('Payoneer',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).secondaryHeaderColor,fontSize: 18,fontWeight: FontWeight.w400),),
                         SizedBox(height: Get.height*0.01,),
             Text('PayPal',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).secondaryHeaderColor,fontSize: 18,fontWeight: FontWeight.w400),),
                         SizedBox(height: Get.height*0.01,),
             Text('Payoneer',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).secondaryHeaderColor,fontSize: 18,fontWeight: FontWeight.w400),),
                         SizedBox(height: Get.height*0.03,),
            //  Text('Add New Method',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: kprimaryColor,fontSize: 18,fontWeight: FontWeight.w600),),
             
          ],
        ),
      ),
    );
  }
}