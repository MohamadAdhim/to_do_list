import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import 'event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  Map<DateTime, List<Event>> events = {
    
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
      backgroundColor:
          Colors.grey,
      // floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add),),
    );
  }

  Widget content() {
    String formattedDate = DateFormat(
      'EEEE, d MMMM y',
    ).format(today);

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            child: TableCalendar(
              rowHeight: 43,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              onDaySelected: _onDaySelected,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Divider(
            color: Colors.lightBlue,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Container(
                child: Text(
                  formattedDate,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
