import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' show cos, sqrt, asin;

class Localisation extends StatefulWidget {
  const Localisation({Key? key}) : super(key: key);

  @override
  State<Localisation> createState() => _LocalisationState();
}

class _LocalisationState extends State<Localisation> {
  void distanceLocalisation() {
    double calculateDistance(lat1, lon1, lat2, lon2) {
      var p = 0.017453292519943295;
      var c = cos;
      var a = 0.5 -
          c((lat2 - lat1) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;

      return 12742 * asin(sqrt(a));
    }

    // ignore: unused_element

    List<dynamic> data = [
      {"lat": 50.3611392, "lng": 3.0769152},
      {"lat": 50.2611392, "lng": 2.996712},
    ];
    double totalDistance = 0;
    for (var i = 0; i < data.length - 1; i++) {
      totalDistance += calculateDistance(data[i]["lat"], data[i]["lng"],
          data[i + 1]["lat"], data[i + 1]["lng"]);
    }
    // ignore: avoid_print
    print(totalDistance);
  }

  var locationMessage = '';

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    // ignore: avoid_print
    print(lastPosition);

    setState(() {
      locationMessage = "$position.latitude , $position.longitude";
    });
  }

  void newPositionnement() async {
    // ignore: unused_local_variable
    List<Location> locations =
        await locationFromAddress("777 rue du pavé, Bersée");
  }

  void lattitudePositionnement() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(52.325959, 3.98989889);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localisation'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 46, color: Colors.green),
            const SizedBox(height: 10),
            const Text('Votre localisation',
                softWrap: true, style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Position : $locationMessage'),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: const Text('localisation'),
                onPressed: () {
                  getCurrentLocation();
                }),
            const SizedBox(
                child: Text('Voici la position de la coiffeuse comparé a vous'))
          ],
        ),
      ),
    );
  }
}
