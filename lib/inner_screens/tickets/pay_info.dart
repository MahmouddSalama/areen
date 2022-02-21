import 'package:areen/consts/colors.dart';
import 'package:areen/inner_screens/tickets/view_ticket_info.dart';
import 'package:flutter/material.dart';
import '../../compponents/auth_button.dart';
import '../../compponents/tikets_field.dart';
import '../../consts/consts_methods.dart';
class PayInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الدفع',
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
                    color:  Colors.blue,
                    iconData: 1,
                    num: 1,
                  ),
                  buildSizedBoxTickets(),
                  buildCircleAvatarTickets(
                    color: Kmaincolor,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                      TicketsField(
                        title: '',
                        textInputType: TextInputType.name,
                        enable: true,
                        hint: 'اسم صاحب البطاقه',
                        textEditingController: null),
                    const SizedBox(height: 20),
                      TicketsField(
                        title: '',
                        enable: true,
                        hint: 'رقم البطاقه',
                        textEditingController: null),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:   [
                        Flexible(
                            child: TicketsField(
                                title: ' ',
                                enable: true,
                                hint: 'الامان',
                                textEditingController: null)),
                        SizedBox(width: 30),
                        Flexible(
                            child: TicketsField(
                                title: '',
                                enable: true,
                                hint: 'تاريخ الانتهاء',
                                textEditingController: null)),
                      ],
                    ),
                    const SizedBox(height: 50,),
                    AuthButton(title: 'الدفع', function: (){
                      navigate(context, ViewTicketInfo());
                    },color: Kmaincolor,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
