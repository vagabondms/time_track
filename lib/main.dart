import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:time_tracking/presentation/screens/home_screen.dart';
import 'package:time_tracking/presentation/screens/statistics_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _Main(),
    );
  }
}

class _Main extends StatefulWidget {
  const _Main({Key? key}) : super(key: key);

  @override
  State<_Main> createState() => _MainState();
}

class _MainState extends State<_Main> {
  int _currentIndex = 0;

  final List<Widget> screens = const <Widget>[
    HomeScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('트레꺼'),
      ),
      body: screens[_currentIndex],
    );
  }
}
