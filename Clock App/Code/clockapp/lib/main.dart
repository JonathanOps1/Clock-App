import 'package:clockapp/clock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/browser.dart' as tz;
import 'package:timezone/data/latest_all.dart';

import './home_screen.dart';

void main() {
  initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
