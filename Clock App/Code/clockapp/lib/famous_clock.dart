import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:timezone/standalone.dart';

class FamousClock extends StatefulWidget {
  FamousClock(
    this.height,
    this.width,
    this.cityName,
    this.time,
    this.assetName,
  );

  final double height;
  final double width;
  final String cityName;
  final TZDateTime time;
  final String assetName;

  @override
  _FamousClockState createState() => _FamousClockState();
}

class _FamousClockState extends State<FamousClock> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          children: [
            Image.asset(
              widget.assetName,
              width: widget.width,
              height: widget.height,
            ),
            FlutterAnalogClock(
              dateTime: widget.time,
              dialPlateColor: Colors.transparent,
              hourHandColor: Colors.black,
              minuteHandColor: Colors.black,
              secondHandColor: Colors.red,
              numberColor: Colors.black,
              borderColor: Colors.black,
              centerPointColor: Colors.black,
              showBorder: true,
              showTicks: false,
              showMinuteHand: true,
              showSecondHand: true,
              showNumber: false,
              borderWidth: 0,
              isLive: true,
              width: widget.width,
              height: widget.height,
              decoration: const BoxDecoration(),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              activeColor: Colors.amber,
              value: checkBoxValue,
              onChanged: (newValue) {
                setState(() {
                  checkBoxValue = newValue!;
                });
              },
            ),
            Text(
              widget.cityName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
