import 'package:areen/compponents/auth_button.dart';
import 'package:areen/screens/auth/auth_stste/auth_state.dart';
import 'package:flutter/material.dart';

import '../../consts/consts_methods.dart';
class FinshGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          SizedBox(
            width: getSize(context).width,
            height: getSize(context).height,
            child: Image.asset(
              "assets/image/game.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: AuthButton(
              title: 'رجوع',
              function: (){
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
