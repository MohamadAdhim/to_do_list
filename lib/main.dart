import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Belum Kepikiran",
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            child: TableCalendar(
              rowHeight: 43,
              headerStyle:
                  HeaderStyle(
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
        ],
      ),
    );
  }
}
