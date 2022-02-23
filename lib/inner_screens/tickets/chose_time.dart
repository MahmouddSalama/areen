import 'package:areen/compponents/auth_button.dart';
import 'package:areen/compponents/tikets_field.dart';
import 'package:areen/consts/colors.dart';
import 'package:areen/inner_screens/tickets/pay_info.dart';
import 'package:flutter/material.dart';

import '../../compponents/calender_events.dart';
import '../../consts/consts_methods.dart';

class ChoseTime extends StatefulWidget {
  @override
  State<ChoseTime> createState() => _ChoseTimeState();
}

class _ChoseTimeState extends State<ChoseTime> {
  TextEditingController numOfTiket = TextEditingController(text: '0');

  TextEditingController money = TextEditingController();
DateTime dateTime =DateTime.now();

  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
                height: 40,
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
              CalenderEvents(getDay: (v) {
                setState(() {
                  dateTime =v;
                });
                print(v);
              }),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                  navigate(context, PayInfo(time: dateTime,numOfTicket: dropdownValue,));
                },
                color: Kmaincolor,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
