import 'package:areen/models/game/quistion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../compponents/auth_button.dart';
import '../../consts/consts_methods.dart';

import 'dart:math';

import 'finsh_game.dart';

class Game extends StatefulWidget {
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int groupValue = 0;
  int num=0;
  int randomNumber = Random().nextInt(9);

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'العب مع عرين',
          style: styleText(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: getSize(context).width,
              height: getSize(context).height * .3,
              color: const Color(0xffFFDBBB),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questions[randomNumber].questionHeader,
                      style: GoogleFonts.almarai(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff188F15),
                          fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    buildRow(1, questions[randomNumber].answers1),
                    buildRow(2, questions[randomNumber].answers2),
                    buildRow(3, questions[randomNumber].answers3),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Flexible(
                  child: AuthButton(
                    title: 'التالي',
                    function: () {
                      if (groupValue == questions[randomNumber].rightAnswer&&num<3) {
                        print('true');
                        showDialog(
                            context: context,
                            builder: (context) {
                              return buildAlertDialogAnswers('صحيحه',context);
                            });
                        randomNumber++;
                        randomNumber = randomNumber % 10;
                        groupValue = 0;
                        num++;
                        if(num==2){
                          Navigator.pop(context);
                          Navigator.pop(context);
                          navigate(context, FinshGame());
                        }
                        setState(() {});
                      } else {
                        print('nop');
                        showDialog(
                            context: context,
                            builder: (context) {
                              return buildAlertDialogAnswers('خاطئة',context);
                            });
                      }
                    },
                    color: Color(0xff40CE71),
                  ),
                ),
                Flexible(
                  child: AuthButton(
                      title: 'خروج', function: () {}, color: Color(0xffFF2626)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }



  Row buildRow(int val, string) {
    return Row(
      children: [
        Radio(
          value: val,
          groupValue: groupValue,
          onChanged: (v) {
            setState(() {
              groupValue = int.parse(v.toString());
            });
          },
          activeColor: const Color(0xff82705F),
        ),
        Text(
          string,
          style: GoogleFonts.almarai(
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20),
        ),
      ],
    );
  }
}
