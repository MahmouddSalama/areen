import 'package:flutter/material.dart';

import '../../consts/consts_methods.dart';
class FinshGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
        width: getSize(context).width,
        height: getSize(context).height,
        child: Image.asset(
          "assets/image/game.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
