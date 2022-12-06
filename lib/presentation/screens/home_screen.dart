import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:table_calendar/table_calendar.dart';

import 'new_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  DateTime _selectedDay = DateTime.now();

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });
  }

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 300));

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 0.9).animate(_controller),
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('new'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showGeneralDialog(
                context: context,
                pageBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return NewTaskScreen();
                },
                transitionBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  child,
                ) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset(0.0, 0.0);
                  const curve = Curves.ease;
                  final tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  _controller.animateTo(animation.value);

                  return SlideTransition(
                    position: tween.animate(animation),
                    child: child,
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
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
            const Divider(
              height: 0,
              thickness: 1,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (BuildContext context) => Scaffold(
                            appBar: CupertinoNavigationBar(),
                            body: Container(),
                          ),
                        ),
                      );
                    },
                    child: StickyHeader(
                      header: Container(
                        child: Text('hi'),
                      ),
                      content: Container(
                        child: Text('bye'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
