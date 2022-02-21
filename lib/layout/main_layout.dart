import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:areen/consts/colors.dart';
import 'package:areen/modules/camera.dart';
import 'package:areen/modules/map.dart';
import 'package:areen/modules/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  CurvedNavigationBar(
        color: Kmaincolor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      items: <Widget>[
        Icon(Icons.person, size: 25,color: Colors.white,),
        Icon(FontAwesomeIcons.ticketAlt, size: 25,color: Colors.white,),
        Icon(Icons.camera_alt, size: 25,color: Colors.white,),
        Icon(FontAwesomeIcons.map, size: 25,color: Colors.white,),
      ],
      onTap: (index) {
        //Handle button tap
        setState(() {
          currentIndex=index;
        });
      },
    ),
      body: Screens[currentIndex],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
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
    );
  }
  x(){
    Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.brightness_5,
          Icons.brightness_4,
          Icons.brightness_6,
          Icons.brightness_7,
        ],
        activeIndex: 1,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => currentIndex = index),
        //other params
      ),
    );
  }
}

