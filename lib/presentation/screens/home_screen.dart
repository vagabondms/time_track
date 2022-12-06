import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_tracking/presentation/screens/new_task_screen.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) {
              /// This is the simplest use case for [CupertinoFullscreenDialogTransition]
              /// This provides the slide up and slide down transition effects
              return CupertinoFullscreenDialogTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,

                /// Content of your dialog
                child: const NewTaskScreen(),
                linearTransition: true,
              );
            },
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween = Tween(begin: begin, end: end);
              final curvedAnimation = CurveTween(curve: curve);

              final transition = tween.chain(curvedAnimation);

              return SlideTransition(
                position: animation.drive(transition),
                child: child,
              );
            },
          );
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
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
