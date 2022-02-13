import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

import '../consts/colors.dart';
import '../consts/consts_methods.dart';
class CalenderEvents extends StatefulWidget {
  final String? Function(dynamic value) getDay;

   CalenderEvents({Key? key,required this.getDay}) : super(key: key);

  @override
  State<CalenderEvents> createState() => _CalenderEventsState();
}

class _CalenderEventsState extends State<CalenderEvents> {
  DateTime? selectedDay;
  List <CleanCalendarEvent>? selectedEvent;
  final Map<DateTime,List<CleanCalendarEvent>> events = {
    DateTime (DateTime.now().year,DateTime.now().month,DateTime.now().day):
    [
      CleanCalendarEvent('',
          startTime: DateTime(
              DateTime.now().year,DateTime.now().month,DateTime.now().day,10,0),
          endTime:  DateTime(
              DateTime.now().year,DateTime.now().month,DateTime.now().day,12,0),
          description: 'A special event',
          color: Colors.blue),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
    [
      CleanCalendarEvent('',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
  };
  void _handleData(date){
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }
  @override
  void initState() {
    // TODO: implement initState
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: getSize(context).width,
      height: 325,
      decoration: const BoxDecoration(
          color: Kmaincolor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
      ),
      child:  Calendar(
        startOnMonday: true,
        selectedColor: Colors.green,
        todayColor: Colors.white,
        eventColor: Colors.green,
        eventDoneColor: Colors.amber,
        bottomBarColor: Colors.white,
        onDateSelected: (date)=>widget.getDay(date),
        events: events,
        isExpanded: true,
        dayOfWeekStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        bottomBarTextStyle: const TextStyle(
          color: Colors.white,
        ),
        hideBottomBar: false,
        hideArrows: false,
        weekDays: const ['الاتنين','الثلاثاء','الاربعاء','الخميس','الجمعه','السبت','الاحد'],
      ),
    );
  }
}
