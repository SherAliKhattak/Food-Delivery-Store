import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/components/circular_back_botton.dart';
import 'package:store_app/components/custom_appbarr.dart';
import 'package:store_app/utils/light_them.dart';

class NotificationTurnOn extends StatelessWidget {
  const NotificationTurnOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: CustomAppBarr(
            title: 'Notification',
            leading: CircularBackButton(),
          )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Push Notifications',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).secondaryHeaderColor),
              ),
              trailing: CupertinoSwitch(
                  activeColor: kprimaryColor,
                  value: true,
                  onChanged: (value) {}),
            ),
            ListTile(
              title: Text(
                'Email Notifications',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).secondaryHeaderColor),
              ),
              trailing: CupertinoSwitch(
                  activeColor: kprimaryColor,
                  value: true,
                  onChanged: (value) {}),
            ),
            ListTile(
                title: Text(
                  'Notification Sound',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
                trailing:  Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).secondaryHeaderColor,
                ))
          ],
        ),
      ),
    );
  }
}
