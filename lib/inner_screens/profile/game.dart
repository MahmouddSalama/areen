import 'package:areen/consts/colors.dart';
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
  int answer = 0;
  int num = 0;
  int randomNumber = Random().nextInt(19);

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
        title: Text(
          'العب مع عرين',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Stack(
          children: [
            Opacity(
              opacity: .09,
              child: SizedBox(
                height: getSize(context).height,
                width: getSize(context).width,
                child: Image.asset(
                  'assets/image/images_Areen/animals_icons_311225.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: getSize(context).width,
                    decoration: const BoxDecoration(
                        color: Kmaincolor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              offset: Offset(0, 3),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'السؤال',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          questions[randomNumber].questionHeader,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: getSize(context).width,
                      height: getSize(context).height * .4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildGestureDetector(
                              value: 1,
                                image: questions[randomNumber].image1
                              ),
                              buildGestureDetector(
                                  value: 2,
                                  image: questions[randomNumber].image2
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildGestureDetector(
                                  value: 3,
                                  image: questions[randomNumber].image3
                              ),
                              buildGestureDetector(
                                  value: 4,
                                  image: questions[randomNumber].image4
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildRow1(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector({required image,required int value}) {
    return GestureDetector(
      onTap: () {
        answer=value;
        setState(() {
        });
      },
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 3, color:answer==value? Colors.green:Kmaincolor)),
        width: 120,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Row buildRow1(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: AuthButton(
            title: 'التالي',
            function: () {
              if (answer == questions[randomNumber].rightAnswer &&
                  num < 4) {
                print('true');
                randomNumber++;
                randomNumber = randomNumber % 20;
                num++;
                answer=0;
                if (num == 3) {
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
                      return buildAlertDialogAnswers('خاطئة', context);
                    });
              }
            },
            color: Kmaincolor,
          ),
        ),
        Flexible(
          child: AuthButton(
              title: 'خروج', function: () {
                Navigator.pop(context);
          }, color: Color(0xffFF2626)),
        ),
      ],
    );
  }
}
