
import 'package:areen/compponents/auth_button.dart';
import 'package:areen/compponents/text_field.dart';
import 'package:areen/consts/colors.dart';
import 'package:areen/consts/consts_methods.dart';
import 'package:areen/layout/main_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController email=TextEditingController();

  final TextEditingController pass=TextEditingController();

  final TextEditingController name=TextEditingController();

  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('مستخدم جديد '),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: getSize(context).height*.1,),
                  RegisterTextFiled(
                      textEditingController: name,
                      title: 'الاسم',
                      validetor: (v){
                        if (v
                            .toString()
                            .isEmpty ) {
                          return 'من فضلك ادخل  الاسم صحيح';
                        }
                  }),
                  RegisterTextFiled(
                      textEditingController: email,
                      title: 'الاميل', validetor: (v){
                    if (v
                        .toString()
                        .isEmpty || !v
                        .toString()
                        .contains("@")) {
                      return 'من فضلك ادخل اميل صحيح';
                    }
                  }),
                  RegisterTextFiled(
                      textEditingController: pass,
                      title: 'كلمة المرور', validetor: (v){
                    if (v
                        .toString()
                        .isEmpty || v
                        .toString()
                        .length < 7) {
                      return 'كلمة المرور يجب ان لا تقل عن سبع حروف';
                    }
                  },
                  isPass: true
                  ),
                  AuthButton(title: 'تسجيل', function: (){
                    _signUp();
                  },color:Kmaincolor,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _submit(ctx){
    if(_formKey.currentState!.validate()){
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
               loading?Center(child: CircularProgressIndicator(color: Kmaincolor,),) :AuthButton(title: 'حسنا', function: (){
                  Navigator.pop(context);
                },color: Color(0xff40CE71),)
              ],
            ),
          ),
        );
      });
    }

  }

  _signUp()async{
    String error = '';
    if(_formKey.currentState!.validate()){
      setState(() {
        loading = true;
      });
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.toLowerCase().trim(),
          password: pass.text.trim(),
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'name': name.text,
          'email': email.text,
          'createdAt': Timestamp.now(),
          'admin': false,
          'password':pass.text,
        });
        Navigator.canPop(context) ? Navigator.pop(context) : null;
        navigateReplace(context, MainLayOut());
      } on FirebaseAuthException catch (e) {
        setState(() {
          loading = false;
        });
        if (e.code == 'weak-password') {
          error = 'كلمة المرور المقدمة ضعيفة للغاية.';
        } else if (e.code == 'email-already-in-use') {
          error = 'الحساب موجود بالفعل لهذا البريد الإلكتروني.';
        }
        showErrorDialog(error.toString(),context);
      } catch (e) {
        print(e);
      }
    }
    setState(() {
      loading = false;
    });
  }
}
