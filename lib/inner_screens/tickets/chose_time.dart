import 'package:areen/compponents/auth_button.dart';
import 'package:areen/compponents/tikets_field.dart';
import 'package:areen/consts/colors.dart';
import 'package:areen/inner_screens/tickets/pay_info.dart';
import 'package:flutter/material.dart';

import '../../compponents/calender_events.dart';
import '../../consts/consts_methods.dart';

class ChoseTime extends StatelessWidget {
  TextEditingController numOfTiket = TextEditingController(text: '0');
  TextEditingController money = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'اختيار التذاكر',
          style: styleText(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: getSize(context).width,
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSizedBoxTickets(),
                  buildCircleAvatarTickets(
                    color: Colors.green,
                    num: 1,
                  ),
                  buildSizedBoxTickets(),
                  buildCircleAvatarTickets(
                    color: const Color(0xffD2E3FE),
                    num: 2,
                  ),
                  buildSizedBoxTickets(),
                  buildCircleAvatarTickets(
                    color: const Color(0xffD2E3FE),
                    num: 3,
                  ),
                  buildSizedBoxTickets()
                ],
              ),
              buildPaddingTitleOfSteps(context),
              CalenderEvents(getDay: (v) {}),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: TicketsField(
                            title: 'عدد التذاكر',
                            enable: true,
                            hint: '##',
                            textEditingController: numOfTiket)),
                    const SizedBox(width: 30),
                    Flexible(
                        child: TicketsField(
                            title: 'المجموع',
                            enable: false,
                            hint: '${int.parse(numOfTiket.text) * 10}ر.س',
                            textEditingController: money)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AuthButton(
                title: 'الدفع',
                function: () {
                  navigate(context, PayInfo());
                },
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
