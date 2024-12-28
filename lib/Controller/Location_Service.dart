import 'package:geolocator/geolocator.dart'; 

class LocationService {
  Future<Position> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    //Store Location Services  Enable or Not
     serviceEnabled = await Geolocator.isLocationServiceEnabled();

     if(!serviceEnabled){ 
      throw Exception('Location Services are Disabled');
     }
    permission = await Geolocator.checkPermission(); // check permission
     if( permission == LocationPermission.denied){
      permission =await Geolocator.requestPermission();
      if(permission==LocationPermission.denied){
        throw Exception('Location Permission are Denied');
      }
     }

     if(permission == LocationPermission.deniedForever){
      throw Exception('Location Permission Is permanently Denied');
     }

     //get the current Location
     final currecnt_location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
     );
     return currecnt_location;

  }
}