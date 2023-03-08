import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Ziua selectata este:" + today.toString().split(" ")[0]),
          TableCalendar(
            rowHeight: 43,
            firstDay: DateTime.utc(2010, 10, 16),
            focusedDay: today,
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) => isSameDay(day, today),
          )
        ],
      ),
    );
  }
}
