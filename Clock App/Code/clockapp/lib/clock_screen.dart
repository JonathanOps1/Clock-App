import 'package:clockapp/dark_clock.dart';
import 'package:clockapp/light_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:intl/intl.dart';

class ClockScreen extends StatefulWidget {
  ClockScreen(this.cityName, this.countryName);

  final String cityName;
  final String countryName;

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  //String ampm = DateFormat('a').format(DateTime.now()).toString();
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('My Clock'),
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDark = !isDark;
              });
            },
            icon: isDark
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: SafeArea(
        child: isDark
            ? DarkClock(widget.cityName, widget.countryName)
            : LightClock(widget.cityName, widget.countryName),
      ),
    );
  }
}
