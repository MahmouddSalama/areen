import 'package:areen/compponents/auth_button.dart';
import 'package:areen/compponents/text_field.dart';
import 'package:areen/consts/consts_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class ForgetPass extends StatelessWidget {
  final TextEditingController email=TextEditingController();
  final TextEditingController pass=TextEditingController();
  final TextEditingController name=TextEditingController();
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
              RegisterTextFiled(title: 'البريد الاكتروني', validetor:(v){},textEditingController: email),
              AuthButton(title:  " تاكيد البريد الاكتروني ", function: ()async{
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('سوف يتم ارسال لك اميل لتغيير كلمه السر',style: TextStyle(
                  color:Colors.white,
                  ),),backgroundColor: Kmaincolor,)
                );
               await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
               Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
