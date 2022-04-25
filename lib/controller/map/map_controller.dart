
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController{

  RxString currentAddress = ''.obs;
  RxString currentAddressName = ''.obs;
  RxDouble currentLatitude = 0.0.obs;
  RxDouble currentLongitude = 0.0.obs;

  TextEditingController edtSearch = TextEditingController();

  getCurrenLocation() async{
    // Location location = Location();
    // LocationData _locationData = await location.getLocation();
    // location.onLocationChanged.listen((LocationData loc) {
    //
    // });

    // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // LocationPermission permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     // Permissions are denied, next time you could try
    //     // requesting permissions again (this is also where
    //     // Android's shouldShowRequestPermissionRationale
    //     // returned true. According to Android guidelines
    //     // your App should show an explanatory UI now.
    //     return Future.error('Location permissions are denied');
    //   }
    // }

    // if (permission == LocationPermission.deniedForever) {
    //   // Permissions are denied forever, handle appropriately.
    //   return Future.error(
    //       'Location permissions are permanently denied, we cannot request permissions.');
    // }
    // if(serviceEnabled){
    //   Position position = await Geolocator.getCurrentPosition();
    //   if(position != null){
    //
    //   }
    // }

    // return position;
  }

  changeLatLon(double lat, double lon){
    currentLatitude.value = lat;
    currentLongitude.value = lon;
  }

  changeAddress(CameraPosition? cameraPosition) async{
    List<Placemark> placemarks = await placemarkFromCoordinates(cameraPosition!.target!.latitude, cameraPosition.target.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    changeLatLon(cameraPosition.target.latitude, cameraPosition.target.longitude);
    currentAddress.value = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }
}