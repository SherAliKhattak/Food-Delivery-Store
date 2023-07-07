import 'package:flutter/material.dart';
import 'package:store_app/screens/dashboard/home.dart';
import 'package:store_app/screens/dashboard/orders.dart';
import 'package:store_app/screens/dashboard/profile.dart';

import '../../components/images_paths.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key, }) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: _selectedIndex == 0
                    ? const Color(0xff2DC0BE)
                    : Colors.white,
                child: Image.asset(
                  Images.home,
                  color: _selectedIndex == 0 ? Colors.white : Colors.black,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: _selectedIndex == 1
                      ? const Color(0xff2DC0BE)
                      : Colors.white,
                  child: Image.asset(
                    Images.orders,
                    color: _selectedIndex == 1 ? Colors.white : Colors.black,
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: _selectedIndex == 2
                      ? const Color(0xff2DC0BE)
                      : Colors.white,
                  child: Image.asset(
                    Images.profile,
                    color: _selectedIndex == 2 ? Colors.white : Colors.black,
                  )),
              label: '',
            ),
           
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Orders(),
    Profile(),
   
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
