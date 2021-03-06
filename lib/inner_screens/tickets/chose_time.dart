import 'package:areen/compponents/auth_button.dart';
import 'package:areen/compponents/tikets_field.dart';
import 'package:areen/consts/colors.dart';
import 'package:areen/inner_screens/tickets/pay_info.dart';
import 'package:flutter/material.dart';

import '../../compponents/calender_events.dart';
import '../../consts/consts_methods.dart';

class ChoseTime extends StatefulWidget {
 final DateTime dateTime;


   ChoseTime({Key? key,required this.dateTime}) : super(key: key);

  @override
  State<ChoseTime> createState() => _ChoseTimeState();
}

class _ChoseTimeState extends State<ChoseTime> {
  TextEditingController numOfTiket = TextEditingController(text: '0');

  TextEditingController money = TextEditingController();

  String dropdownValue = '1';

  dynamic dayData = {
    "1" : "الاتنين",
    "2" : "الثلاثاء",
    "3" : "الاربعاء",
    "4" : "الخميس",
    "5" : "الجمعه",
    "6" : "السبت",
    "7" : "الاحد" };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'اختيار التذاكر',
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
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSizedBoxTickets(),
                  buildCircleAvatarTickets(
                    color: Kmaincolor,
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
              Text( '${widget.dateTime.year}/${widget.dateTime.month}/${widget.dateTime.day}',
                style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),),
              Text(dayData['${widget.dateTime.weekday}'], style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
              ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('عدد التذاكر'),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey
                        ),
                          color: const Color(0xffF3F3F2),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      width: getSize(context).width,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color:Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['1', '2', '3', '4','5', '6', '7', '8','9','10']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 30),
                    TicketsField(
                      validetor: (n){},
                        title: 'المجموع',
                        enable: false,
                        hint: '${int.parse(dropdownValue) * 10}  ر.س ',
                        textEditingController: money),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AuthButton(
                title: 'الدفع',
                function: () {
                  navigate(context, PayInfo(time: widget.dateTime,numOfTicket: dropdownValue,));
                },
                color: Kmaincolor,
              ),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
