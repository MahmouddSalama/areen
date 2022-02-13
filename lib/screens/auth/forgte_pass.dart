import 'package:areen/compponents/text_field.dart';
import 'package:areen/consts/consts_methods.dart';
import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class ForgetPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    "نسيت كلمه المرور ",
                    style: styleText(color: Colors.black, fontSize: 30),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.red,
                        size: 30,
                      ))
                ],
              ),

              RegisterTextFiled(title: 'البريد الاكتروني', validetor:(v){} ),
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffC5C5C5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    " تاكيد البريد الاكتروني ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
