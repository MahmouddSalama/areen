import 'package:areen/compponents/auth_button.dart';
import 'package:areen/compponents/text_field.dart';
import 'package:areen/consts/consts_methods.dart';
import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class ForgetPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:   Text(
          "نسيت كلمه المرور ",

        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: getSize(context).height*.1,),
              RegisterTextFiled(title: 'البريد الاكتروني', validetor:(v){} ),
              AuthButton(title:  " تاكيد البريد الاكتروني ", function: (){})
            ],
          ),
        ),
      ),
    );
  }
}
