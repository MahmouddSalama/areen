import 'package:areen/consts/colors.dart';
import 'package:flutter/material.dart';

import '../../compponents/auth_button.dart';
import '../../compponents/text_field.dart';
import '../../consts/consts_methods.dart';
class EditProfileInfo extends StatefulWidget {
  @override
  State<EditProfileInfo> createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'تحرير المعلومات الشخصيه',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: getSize(context).height*.14,),
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
                  AuthButton(title: 'حفظ التعديلات', function: (){_submit(context);
                  },color:Kmaincolor,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _submit(ctx) {
    if(_formKey.currentState!.validate()||true){
      showDialog(context: ctx, builder: (ctx){
        return alertDialogEditInfo(context: context,function: (){
          Navigator.pop(context);
          showDialog(context: ctx, builder: (ctx){
            return alertDialogConfirmEdit(context);
          });
        });
      });
    }
  }


}
