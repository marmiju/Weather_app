  import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Controller/Location_Service.dart';

Future<void> fetchLocation() async {
    LocationService locationService = LocationService();
    try {
      Position position = await locationService.getUserLocation();
      print('Latitude: ${position.latitude}');
      print('Longitude: ${position.longitude}');
    } catch (e) {
      print('Error: $e');
    }
  }