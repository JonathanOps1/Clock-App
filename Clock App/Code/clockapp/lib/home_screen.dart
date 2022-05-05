import 'package:clockapp/famous_clocks_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/standalone.dart' as tz;

import 'package:clockapp/clock_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  String cityName = '';
  String countryName = '';

  Future<void> getCurrentLocation() async {
    //await tz.initializeTimeZone();
    var detroit = tz.getLocation('America/Detroit');
    var now = tz.TZDateTime.now(detroit);
    // var locations = tz.timeZoneDatabase.locations;
    print('time fetched: ' + now.toString());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await getAddressFromLatLng(
      Coordinates(position.latitude, position.longitude),
    );
  }

  Future<void> getAddressFromLatLng(Coordinates coordinates) async {
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    cityName = first.locality;
    countryName = first.countryName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: const Text(
              'Turn on the device location and click the below button so that the app can fetch your location and show the clock of your region.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          //show my clock button
          isLoading
              ? const CircularProgressIndicator(
                  color: Colors.amber,
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 70,
                      vertical: 18,
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    var status = await Permission.location.status;
                    //check permission status
                    if (status.isDenied) {
                      await Permission.location.request();
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      //check location service status
                      if (await Permission
                          .locationWhenInUse.serviceStatus.isEnabled) {
                        await getCurrentLocation();
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ClockScreen(cityName, countryName),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Turn on location service to continue'),
                            backgroundColor: Colors.amber,
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                  child: const Text(
                    'Get my Clock!',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
          const SizedBox(
            height: 30,
          ),
          //show famous clocks button
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              side: const BorderSide(
                color: Colors.amber,
                width: 2,
              ),
              primary: Colors.amber,
              padding: const EdgeInsets.symmetric(
                horizontal: 44,
                vertical: 17,
              ),
            ),
            onPressed: () {
              isLoading
                  ? null
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FamousClocksScreen(),
                      ),
                    );
            },
            child: const Text(
              'Show Famous Clocks',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
