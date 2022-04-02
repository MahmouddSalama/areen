import 'package:areen/compponents/auth_button.dart';
import 'package:areen/compponents/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../consts/colors.dart';
import '../../consts/consts_methods.dart';

class Questionnaire extends StatefulWidget {
  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int groupValue1 = 0, groupValue2 = 0, groupValue3 = 0;
 bool  loading=false;
  final age =TextEditingController();
  final message =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'استبيان',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: RegisterTextFiled(
                  textEditingController: age,
                  title: 'العمر',
                  validetor: (v) {
                    if (v.toString().isEmpty) {
                      return 'ادخل رقم صحيح';
                    }
                  },
                  textInputType: TextInputType.number,
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              buildRow(
                  title:
                      '1- بالنظر الي تجربتك لتطبيق عرين ما مدي ان توصي به لصيق او قريب ؟ ',
                  groupValue: groupValue1,
                row: 1,
                x: 0
               ),
              buildRow(
                  row: 2,
                  title: '2- ما مدي سهوله استخدام التطبيق ؟ ',
                  groupValue: groupValue2,x: 1),
              buildRow(
                  row: 3,
                  title: '3- ما هو تقسمك لجوده المعلومات في تطبيق عريم ؟',
                  groupValue: groupValue3,x: 2),
             const  SizedBox(height: 20,),
              Text('اقتراحك',style: styleText(
                fontSize: 30,
                color: Colors.black
              ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RegisterTextFiled(title: '', validetor: (v){},lines: 4,textInputType: TextInputType.text,textEditingController: message),
              ),
              const  SizedBox(height: 20,),
             loading?const Center(child: CircularProgressIndicator()): AuthButton(title: 'حفظ', function: (){
                //
               save();
              })
            ],
          ),
        ),
      ),
    );
  }

  Row buildRow({required title, required int groupValue,required int row,required int x}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
            child: SizedBox(
          width: 200,
          child: Text(
            title,
            style: GoogleFonts.almarai(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        )),
        buildColumn(title: "ممتاز", va: 1, groupValue: groupValue,row: 1,x:x),
        buildColumn(title: "متوسط", va: 2, groupValue: groupValue,row: 2,x: x),
        buildColumn(title: "ضعيف", va: 3, groupValue: groupValue,row:3,x: x),

      ],
    );
  }

  Column buildColumn(
      {required title, required int va, required int groupValue,required int row,required int x}) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.almarai(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Radio(
          value: va,
          groupValue: groupValue,
          onChanged: (v) {
            setState(() {
              if(x==0){
                groupValue1 = int.parse(v.toString());
              }
              if(x==1){
                groupValue2 = int.parse(v.toString());
              }
              if(x==2){
                groupValue3 = int.parse(v.toString());
              }
              print(groupValue1);
              print(va);
            });
          },
        ),
      ],
    );
  }

  save()async{
    String error = '';
    if(int.parse(age.text)>=6&&groupValue1!=0&&groupValue2!=0&&groupValue3!=0){
      setState(() {
        loading = true;
      });
      try {
        await FirebaseFirestore.instance
            .collection('Questionnaire')
            .doc()
            .set({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'age': int.parse(age.text),
          'groupValue1':groupValue1,
          'groupValue2':groupValue2,
          'groupValue3':groupValue3,
          'message':message.text,
          'createdAt': Timestamp.now(),
        }).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('تم ارسال الاستبيان بنجاح'),
            backgroundColor: Kmaincolor,
          ));
          age.text='';
          message.text='';
          groupValue1=0;
          groupValue2=0;
          groupValue3=0;
          setState(() {});
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          loading = false;
        });
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
