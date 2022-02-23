import 'package:areen/consts/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../compponents/auth_button.dart';
import '../../compponents/text_field.dart';
import '../../consts/consts_methods.dart';
class EditProfileInfo extends StatefulWidget {
  @override
  State<EditProfileInfo> createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController name = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'تحرير المعلومات الشخصيه',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            try{
              final docs = snapshot.data!.docs.firstWhere((element) =>element.id==FirebaseAuth.instance.currentUser!.uid);
              email.text=docs['email'];
              pass.text=docs['password'];
              name.text=docs['name'];
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (snapshot.hasError) {
                return const Center(child: Text("error"));
              }
              else if (snapshot.hasData && snapshot.data!.docs.length != 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: getSize(context).height*.14,),
                          RegisterTextFiled(
                              enable: false,title: 'الاسم',
                              validetor: (v){
                                if (v
                                    .toString()
                                    .isEmpty ) {
                                  return 'من فضلك ادخل  الاسم صحيح';
                                }
                              },textEditingController: name),
                          RegisterTextFiled(enable: false,title: 'الاميل', validetor: (v){
                            if (v
                                .toString()
                                .isEmpty || !v
                                .toString()
                                .contains("@")) {
                              return 'من فضلك ادخل اميل صحيح';
                            }
                          },textEditingController: email),
                          RegisterTextFiled(enable: false,title: 'كلمة المرور', validetor: (v){
                            if (v
                                .toString()
                                .isEmpty || v
                                .toString()
                                .length < 7) {
                              return 'كلمة المرور يجب ان لا تقل عن سبع حروف';
                            }
                          },textEditingController: pass,
                            isPass: true,),
                          AuthButton(title: 'حفظ التعديلات', function: (){_submit(context);
                          },color:Kmaincolor,)
                        ],
                      ),
                    ),
                  ),
                );
              }

            }catch(e){

            }
            return Center(child: CircularProgressIndicator());
          }
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
