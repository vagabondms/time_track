import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDay = DateTime.now();

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]),
              child: TableCalendar(
                locale: 'ko_KR',
                onDaySelected: onDaySelected,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2999, 12, 31),
                focusedDay: _selectedDay,
                selectedDayPredicate: (DateTime day) {
                  return day == _selectedDay;
                },
                calendarBuilders: CalendarBuilders(),
              ),
            ),
            Divider(
              height: 0,
              thickness: 1,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                    Text('hi'),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}