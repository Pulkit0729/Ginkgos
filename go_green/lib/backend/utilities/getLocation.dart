import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> determinePosition(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    } else {
      return await Geolocator.getCurrentPosition();
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  } else {
    await Geolocator.getCurrentPosition();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    } else {
      return await Geolocator.getCurrentPosition();
    }
  }
}

Future<bool> checkAvailability(lat, lon) async {
  List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lon);
  print(placeMarks[0].postalCode);
  bool result = await FirebaseDatabase.instance
      .reference()
      .child('Nurseries')
      .once()
      .then((value) {
    if (value.value[placeMarks[0].postalCode] != null) {
      return true;
    } else {
      return false;
    }
  });
  return result;
}
