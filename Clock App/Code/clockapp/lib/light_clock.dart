import 'package:flutter/material.dart';

import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class LightClock extends StatefulWidget {
  LightClock(this.cityName, this.countryName);

  final String cityName;
  final String countryName;

  @override
  _LightClockState createState() => _LightClockState();
}

class _LightClockState extends State<LightClock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: FlutterAnalogClock(
            dateTime: DateTime.now(),
            dialPlateColor: Colors.white,
            hourHandColor: Colors.black,
            minuteHandColor: Colors.black,
            secondHandColor: Colors.red,
            numberColor: Colors.black,
            borderColor: Colors.black,
            centerPointColor: Colors.red,
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
            color: Colors.black,
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
