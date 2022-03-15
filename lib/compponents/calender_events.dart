import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../consts/colors.dart';
import '../consts/consts_methods.dart';

class CalenderEvents extends StatefulWidget {
  final String? Function(dynamic value) getDay;

   CalenderEvents({Key? key,required this.getDay}) : super(key: key);

  @override
  State<CalenderEvents> createState() => _CalenderEventsState();
}

class _CalenderEventsState extends State<CalenderEvents> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: getSize(context).width,
      height: 350,
      child:  TableCalendar(
        currentDay: _selectedDay,
        enabledDayPredicate: (date){
          return date.weekday!=DateTime.sunday;
        },
        onDaySelected: (selectedDay, focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
         setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        widget.getDay(_selectedDay);
      });
    }
        },
        calendarStyle: const CalendarStyle(
         todayDecoration: BoxDecoration(
           color: Kmaincolor,
           shape: BoxShape.circle
         )
        ),
        firstDay: DateTime.now(),
        lastDay: DateTime(2030, 3, 14),
        focusedDay: _focusedDay,
        locale: 'ar_AR',
      ),
    );
  }
}
