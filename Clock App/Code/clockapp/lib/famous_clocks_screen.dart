import 'package:flutter/material.dart';
import 'package:timezone/standalone.dart' as tz;

import './famous_clock.dart';

class FamousClocksScreen extends StatefulWidget {
  const FamousClocksScreen({Key? key}) : super(key: key);

  @override
  _FamousClocksScreenState createState() => _FamousClocksScreenState();
}

class _FamousClocksScreenState extends State<FamousClocksScreen> {
  var pragueLocation = tz.getLocation('Europe/Prague');
  var meccaLocation = tz.getLocation('Asia/Mecca');
  var lonLocation = tz.getLocation('UnitedKingomd/London');

  @override
  Widget build(BuildContext context) {
    var pragueTime = tz.TZDateTime.now(pragueLocation);
    var meccaTime = tz.TZDateTime.now(meccaLocation);
    var lonTime = tz.TZDateTime.now(lonLocation);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Suggested For You'),
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.amber,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FamousClock(
              200,
              200,
              'Mecca',
              meccaTime,
              'assets/images/clock.jpeg',
            ),
            const Divider(
              thickness: 3,
              color: Colors.black54,
              endIndent: 25,
              indent: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FamousClock(
                  150,
                  130,
                  'London',
                  lonTime,
                  'assets/images/clock2.jpeg',
                ),
                FamousClock(
                  150,
                  130,
                  'Prague',
                  pragueTime,
                  'assets/images/clock3.png',
                ),
              ],
            )
          ],
        ));
  }
}
