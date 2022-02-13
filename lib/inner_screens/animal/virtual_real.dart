import 'package:flutter/material.dart';

import '../../consts/consts_methods.dart';
class VirtualReal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xff83B5FA),
        title: Text(
          'الحيوانات',
          style: styleText(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: getSize(context).height,
            width: getSize(context).width,
            child: Image.network(
              "https://www.marylandzoo.org/wp-content/uploads/2017/12/osage-orange.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment(0,1),
            child: SizedBox(
              height: getSize(context).height*.5,
              width: getSize(context).width,
              child: Image.asset(
                "assets/image/cammel.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
