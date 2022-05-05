import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class DarkClock extends StatefulWidget {
  DarkClock(this.cityName, this.countryName);

  final String cityName;
  final String countryName;

  @override
  _DarkClockState createState() => _DarkClockState();
}

class _DarkClockState extends State<DarkClock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //clock start
        Container(
          alignment: Alignment.topCenter,
          child: FlutterAnalogClock(
            dateTime: DateTime.now(),
            dialPlateColor: Colors.black,
            hourHandColor: Colors.teal,
            minuteHandColor: Colors.teal,
            secondHandColor: Colors.red,
            numberColor: Colors.amber,
            borderColor: Colors.amber,
            tickColor: Colors.teal,
            centerPointColor: Colors.amber,
            showBorder: true,
            showTicks: true,
            showMinuteHand: true,
            showSecondHand: true,
            showNumber: true,
            borderWidth: 6,
            isLive: true,
            width: 250,
            height: 250,
            decoration: const BoxDecoration(),
          ),
        ),
        //address
        Text(
          '${widget.cityName}, ${widget.countryName}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        //digital clock
        DigitalClock(
          areaHeight: 80,
          areaAligment: AlignmentDirectional.center,
          areaWidth: 260,
          is24HourTimeFormat: true,
          areaDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}
