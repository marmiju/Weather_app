

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Controller/Location_Service.dart';

class LocationNotifier extends StateNotifier <Position?> {
    LocationNotifier() : super(null);
   
   Future<void> fetchLocation() async {
    LocationService locationService = LocationService();
    try {
      Position position = await locationService.getUserLocation();
      print("position ${position.toString()}");
      state = position ;
    } catch (e) {
      state =  null ;
      print('Error: $e');
    }
  }

}

//Set Provider
final locationProvider = StateNotifierProvider<LocationNotifier, Position?>(
  (ref) => LocationNotifier(),
);