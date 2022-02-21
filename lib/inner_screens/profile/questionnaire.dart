import 'package:areen/compponents/auth_button.dart';
import 'package:areen/compponents/text_field.dart';
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: RegisterTextFiled(
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
                groupValue: groupValue1),
            buildRow(
                title: '2- ما مدي سهوله استخدام التطبيق ؟ ',
                groupValue: groupValue2),
            buildRow(
                title: '3- ما هو تقسمك لجوده المعلومات في تطبيق عريم ؟',
                groupValue: groupValue3),
           const  SizedBox(height: 20,),
            Text('اقتراحك',style: styleText(
              fontSize: 30,
              color: Colors.black
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RegisterTextFiled(title: '', validetor: (v){},lines: 4,textInputType: TextInputType.text,),
            ),
            const  SizedBox(height: 20,),
            AuthButton(title: 'حفظ', function: (){
              //
            })
          ],
        ),
      ),
    );
  }

  Row buildRow({required title, required int groupValue}) {
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
        buildColumn(title: "ممتاز", va: 1, groupValue: groupValue),
        buildColumn(title: "متوسط", va: 2, groupValue: groupValue),
        buildColumn(title: "ضعيف", va: 3, groupValue: groupValue),

      ],
    );
  }

  Column buildColumn(
      {required title, required int va, required int groupValue}) {
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
              groupValue = int.parse(v.toString());
              print(groupValue);
            });
          },
        ),
      ],
    );
  }
}
