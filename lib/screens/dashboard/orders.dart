import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/circular_back_botton.dart';
import 'package:store_app/components/custom_appbarr.dart';
import 'package:store_app/utils/light_them.dart';
import 'package:timelines/timelines.dart';

import '../../components/images_paths.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        
        appBar:   PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: CustomAppBarr(
              leading: const  CircularBackButton(),
              title: 'orders'.tr,
            )),
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const  Spacer(),
              Center(child: Text('noorders'.tr,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).secondaryHeaderColor
              ),)),
             const  Spacer()
              // ListView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: kwhiteContainer,
              //               borderRadius: BorderRadius.circular(10)),
              //           child: Column(
              //             children: [
              //               ListTile(
              //                 title: ListView.builder(
              //                     physics:
              //                         const NeverScrollableScrollPhysics(),
              //                     shrinkWrap: true,
              //                     itemCount: 2,
              //                     padding: EdgeInsets.zero,
              //                     itemBuilder: (context, index) {
              //                       return ListTile(
              //                         leading: Image.asset(Images.shawarma),
              //                         title: Text(
              //                           'Item Name',
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .bodyLarge!
              //                               .copyWith(color: kprimaryColor),
              //                         ),
              //                         subtitle: const Text('Category'),
              //                       );
              //                     }),
              //                 trailing: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.end,
              //                   children: [
              //                     Text(
              //                       '\$ 99',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge!
              //                           .copyWith(fontSize: 20),
              //                     ),
              //                     Text(
              //                       '10/11/23',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodyLarge!
              //                           .copyWith(
              //                               fontSize: 16,
              //                               fontWeight: FontWeight.w400),
              //                     )
              //                   ],
              //                 ),
              //                 subtitle: Text(
              //                   'ID # 10210021341',
              //                   style: Theme.of(context).textTheme.bodyMedium,
              //                 ),
              //               ),
              //               Container(
              //                 height: Get.height*0.1,
              //                 width: Get.width*0.78,
              //                   padding:
              //                       const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              //                       margin: const EdgeInsets.symmetric(vertical: 10),
              //                  decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20),
              //                   border: Border.all(color: kprimaryColor)
              //                  ),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(10.0),
              //                     child: Timeline.tileBuilder(
              //                       physics:const  NeverScrollableScrollPhysics(),
              //                       shrinkWrap: true,
              //                       theme: TimelineThemeData(
              //                           nodePosition: 0.9,
              //                           indicatorPosition: 0.8,
              //                           direction: Axis.horizontal,
              //                           color: kprimaryColor,
              //                           indicatorTheme:
              //                               const IndicatorThemeData(
              //                                   color: kprimaryColor)),
              //                       builder: TimelineTileBuilder.connected(
              //                           contentsAlign: ContentsAlign.reverse,
              //                           itemExtentBuilder: (_, __) =>
              //                               MediaQuery.of(context).size.width /
              //                               2,
              //                           connectorBuilder:
              //                               (context, index, type) {
              //                             return const SolidLineConnector(
              //                               thickness: 10,
              //                               color: kprimaryColor,
              //                               space: 10,
              //                             );
                                          
              //                           },
              //                           connectionDirection:
              //                           ConnectionDirection.before,
              //                           itemCount: 2,
              //                           contentsBuilder: (context, index) =>
              //                              const  Align(
              //                                 alignment: Alignment.centerLeft,
              //                                 child:  Text(                                                  
              //                                   'Picked',                                                  
              //                                   textAlign: TextAlign.start,
              //                                 ),
              //                               ),
              //                           indicatorBuilder: (context, index) {
              //                             return const CircleAvatar(
              //                               backgroundColor: kprimaryColor,
              //                               radius: 15,
              //                               child: Icon(
              //                                 Icons.check,
              //                                 size: 15,
              //                                 color: Colors.white,
              //                               ),
              //                             );
              //                           },
              //                           indicatorPositionBuilder:
              //                               ((context, index) {
              //                             return 0.0;
              //                           })),
              //                     ),
              //                   )),
              //             ],
              //           ),
              //         ),
              //       );
              //     })
            ],
          ),
        ));
  }
}
