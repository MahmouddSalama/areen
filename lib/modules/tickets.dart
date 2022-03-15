import 'package:areen/compponents/auth_button.dart';
import 'package:areen/compponents/calender_events.dart';
import 'package:areen/consts/colors.dart';
import 'package:areen/consts/consts_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../inner_screens/tickets/chose_time.dart';
class Tikets extends StatefulWidget {
  @override
  State<Tikets> createState() => _TiketsState();
}

class _TiketsState extends State<Tikets> {
DateTime dateTime=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('الاوقات المتاحة',),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            children: [
              SizedBox(
                width: getSize(context).width,
                height: 10,
              ),
               CalenderEvents(getDay: (v){
                 dateTime=v;
                 setState(() {});
               print(v.toString());
               }),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                 crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("الوقت",style: GoogleFonts.almarai(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                        Text('ما عدا يوم الجمعه'),
                        buildContainerTime(text: '9ص -5م')
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("يوم الجمعه",style: GoogleFonts.almarai(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(height: 5),
                        buildContainerTime(text: '1م -5م')
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              AuthButton(title: 'حجز', function: (){
                navigate(context, ChoseTime(dateTime: dateTime,));
                // go to
              },color: Kmaincolor),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
