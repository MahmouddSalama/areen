import 'package:areen/compponents/text_field.dart';
import 'package:areen/consts/colors.dart';
import 'package:areen/consts/consts_methods.dart';
import 'package:areen/screens/auth/forgte_pass.dart';
import 'package:areen/screens/auth/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../compponents/auth_button.dart';
import '../../layout/main_layout.dart';
class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key:_formKey ,
            child: Column(
              children: [
                Container(
                  width:  getSize(context).width,
                  height: getSize(context).height*.45,
                  decoration: const BoxDecoration(
                    color: Kmaincolor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center (
                      child: Column(
                        children: [
                          SizedBox(height: getSize(context).height*.08,),
                          Row(
                            children: [
                              Text("مرحبا بعدوتك",style: styleText(
                                color: Colors.white,
                                fontSize: 30
                              ),),
                            ],
                          ),
                          const SizedBox(height:20,),
                          Text(" تسجيل الدخول",style: styleText(
                              color: Colors.white,
                              fontSize: 30
                          ),),
                          SizedBox(
                            width: 200,
                            height: 150,
                            child: Image.asset(
                              "assets/image/yreklive_1.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: RegisterTextFiled(title: 'الاميل', validetor: (v){
                    if (v
                        .toString()
                        .isEmpty || !v
                        .toString()
                        .contains("@")) {
                      return 'من فضلك ادخل اميل صحيح';
                    }
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: RegisterTextFiled(title: 'كلمة المرور', validetor: (v){
                    if (v
                        .toString()
                        .isEmpty || !v
                        .toString()
                        .contains("@")) {
                      return 'من فضلك ادخل اميل صحيح';
                    }
                  }),
                ),
                buildRichText(function: (){
                  navigate(context, RegisterScreen());
                }),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    navigate(context, ForgetPass());
                  },
                 child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(
                       color: Colors.black,
                       width: 1
                     )
                   ),
                   width: 150,
                   height: 20,
                   alignment: Alignment.center,
                   child: const Text(" نسيت كلمه المرور ", style: TextStyle(
                     fontSize: 12,color: Colors.black,
                       decoration: TextDecoration.underline
                   ),),
                 ),
               ),
                const SizedBox(height: 20,),
                AuthButton(title: 'تسجيل', function: (){
                  navigate(context, MainLayOut());
                },color:Kmaincolor,)
              ],
            ),
          ),
        ),
      ),
    );
  }


}
