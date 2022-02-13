
import 'package:areen/compponents/auth_button.dart';
import 'package:areen/compponents/text_field.dart';
import 'package:areen/consts/consts_methods.dart';
import 'package:flutter/material.dart';
class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        )),
                    SizedBox(width: 30,),
                    Text('مستخدم جديد ',style: styleText(
                      color: Colors.black,
                      fontSize: 30
                    ),),

                  ],
                ),
                RegisterTextFiled(title: 'الاسم',
                    validetor: (v){
                      if (v
                          .toString()
                          .isEmpty ) {
                        return 'من فضلك ادخل  الاسم صحيح';
                      }
                }),
                RegisterTextFiled(title: 'الاميل', validetor: (v){
                  if (v
                      .toString()
                      .isEmpty || !v
                      .toString()
                      .contains("@")) {
                    return 'من فضلك ادخل اميل صحيح';
                  }
                }),
                RegisterTextFiled(title: 'كلمة المرور', validetor: (v){
                  if (v
                      .toString()
                      .isEmpty || v
                      .toString()
                      .length < 7) {
                    return 'كلمة المرور يجب ان لا تقل عن سبع حروف';
                  }
                },
                isPass: true),
                AuthButton(title: 'تسجيل', function: (){
                  _submit(context);
                },color: Color(0xff40CE71),)
              ],
            ),
          ),
        ),
      ),
    );
  }
  _submit(ctx){
    if(_formKey.currentState!.validate()||true){
      showDialog(context: ctx, builder: (ctx){
        return AlertDialog(
          title:  Text('تم انشاء حسابك بنجاح ',style: styleText(
              color: Colors.black,
              fontSize: 20
          ),),
          content: Container(
            height: 150,
            child: Column(
              children: [
                const Text('يمكنك الان الاستفاده من خدمات عرين كزائر مسجل ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54
                ),),
                SizedBox(height: 10,),
                AuthButton(title: 'حسنا', function: (){
                },color: Color(0xff40CE71),)
              ],
            ),
          ),
        );
      });
    }

  }
}
