import 'package:areen/consts/colors.dart';
import 'package:areen/modules/camera.dart';
import 'package:areen/modules/map.dart';
import 'package:areen/modules/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../modules/tickets.dart';

class MainLayOut extends StatefulWidget {
  @override
  State<MainLayOut> createState() => _MainLayOutState();
}

class _MainLayOutState extends State<MainLayOut> {
  int currentIndex=0;
List Screens=[
  Profilescreen(),
  Tikets(),
  Camera(),
  MapScreen(),

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Kmaincolor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.person,), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: ''),
        ],
        onTap: (index){
       setState(() {
         currentIndex=index;
       });
        },
      ),
      body: Screens[currentIndex],
    );
  }
}
