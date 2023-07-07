import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/circular_back_botton.dart';
import 'package:store_app/components/custom_appbarr.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBarr(
            leading: const CircularBackButton(),
            title: 'notifications'.tr,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'nonotifications'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).secondaryHeaderColor),
              )
              // Text('Today',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              //     color: Theme.of(context).secondaryHeaderColor
              //   ),),
              //  const SizedBox(height: 10,),
              // ListView.separated(
              //   physics:const NeverScrollableScrollPhysics(),
              //   separatorBuilder: (context, index) => SizedBox(height: Get.height*0.01,),
              //   shrinkWrap: true,
              //   itemCount: 5,
              //   itemBuilder: (context, index){
              //     return Container(
              //       padding: const EdgeInsets.all(10),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: const Color(0xFFE6E6E6))
              //       ),
              //       child: ListTile(
              //         contentPadding: EdgeInsets.zero,
              //         leading: Image.asset(Images.notifications,height: 30,width: 40,),
              //         title:  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).secondaryHeaderColor,fontSize: 12)),
              //         trailing:  Text('Monday | 12:25 pm',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: kprimaryColor,fontSize: 12),),
              //       ),
              //     );

              //   }),
              //   SizedBox(height: Get.height*0.02,),
              //   Text('23 Jan 2023',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              //     color: Theme.of(context).secondaryHeaderColor
              //   )),
              //   SizedBox(height: Get.height*0.02,),
              // ListView.separated(
              //   physics:const  NeverScrollableScrollPhysics(),
              //   separatorBuilder: (context, index) => SizedBox(height: Get.height*0.01,),
              //   shrinkWrap: true,
              //   itemCount: 5,
              //   itemBuilder: (context, index){
              //     return Container(
              //       padding: const EdgeInsets.all(10),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: const Color(0xFFE6E6E6))
              //       ),
              //       child: ListTile(
              //         contentPadding: EdgeInsets.zero,
              //         leading: Image.asset(Images.notifications,height: 30,width: 40,),
              //         title:  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).secondaryHeaderColor,fontSize: 12)),
              //         trailing:  Text('Monday | 12:25 pm',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: kprimaryColor,fontSize: 12),),
              //       ),
              //     );

              //   })
            ],
          ),
        ),
      ),
    );
  }
}
