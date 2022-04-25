import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:misterfix/controller/map/map_controller.dart';
import 'package:misterfix/utils/constant_style.dart';
import 'package:misterfix/utils/image_constant.dart';
import 'package:misterfix/widget/font/text_meta.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController googleMapController;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.252300, 106.847336),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  //contrller for Google map
  CameraPosition? cameraPosition;
  MapController controller = MapController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.getCurrenLocation();
    getCurrenLocation();
    // controller.getCurrenLocation();
  }

  getCurrenLocation() async{
    // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if(serviceEnabled){
    //
    // }
    Position position = await Geolocator.getCurrentPosition();
    if(position != null){

    }
    // Position position = await Geolocator.getCurrentPosition();
    // if(position != null){
    //   cameraMove(CameraPosition(
    //       target: LatLng(position.latitude, position.longitude),
    //       zoom: 19.151926040649414
    //   ));
    // }
    // Location location = Location();
    // LocationData _locationData = await location.getLocation();
    // cameraMove(CameraPosition(
    //   target: LatLng(_locationData.latitude, _locationData.longitude),
    //   zoom: 19.151926040649414
    // ));
  }

  showGoogleSearchPlace() async {
    Prediction p = await PlacesAutocomplete.show(
        context: context,
        apiKey: 'AIzaSyDPq_TPd_Jdc_ktaLzFIU2e30GoF11yBvc',
        mode: Mode.overlay, // Mode.fullscreen
        language: "fr",
        components: [new Component(Component.country, "id")]);

    if(p != null){
      final places = new GoogleMapsPlaces(apiKey: "AIzaSyDPq_TPd_Jdc_ktaLzFIU2e30GoF11yBvc");
      PlacesDetailsResponse response = await places.getDetailsByPlaceId(p.placeId);
      if(response != null){
        controller.currentAddress.value = response.result.formattedAddress;
        controller.edtSearch.text = response.result.name;
        cameraMove(CameraPosition(
            target: LatLng(response.result.geometry.location.lat, response.result.geometry.location.lng),
            zoom: 19.151926040649414
        ));
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(()=>Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: ()=>showGoogleSearchPlace(),
          child: headerTitle(),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  googleMapController = controller;
                  _controller.complete(controller);
                });
              },
              onCameraMove: (pos){
                cameraPosition = pos;
                // cameraMove(pos);
              },
              onCameraIdle: () async {
                controller.changeAddress(cameraPosition);
              },
            ),
            Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: GestureDetector(
                      onTap: () {
                        // if (bloc.currentLocation != null) {
                        //   _goToSpecifiedPosition(LatLng(bloc.currentLocation.latitude,
                        //       bloc.currentLocation.longitude));
                        // }
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          ImageConstant.markerMap,
                          fit: BoxFit.contain,
                        ),
                      )),
                ))
          ],
        ),
      ),
      bottomSheet: Container(
        height: size.height * 0.17,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: ConstantStyle.boxShadowButtonBorder(
            color: Colors.white,
            radius: 15,
            spreadRadius: 0,
            blurRadius: 13,
            colorShadow: Colors.grey.shade400,
            offset: Offset(1, 3)
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.map, color: Colors.black45),
                SizedBox(width: 10),
                TextMeta('Lokasi anda sekarang : ', color: Colors.black45, size: 14, weight: FontWeight.w600,),
              ],
            ),
            SizedBox(height: 10),
            TextMeta(controller.currentAddress.value, color: Colors.black45, size: 13, maxLines: 100,),
            SizedBox(height: 10),
            Container(
              decoration: ConstantStyle.boxButton(radius: 10, color: Colors.blue),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: InkWell(
                onTap: (){
                  var data = {
                    'address':controller.currentAddress.value,
                    'location': LatLng(controller.currentLatitude.value, controller.currentLongitude.value)
                  };
                  Get.back(result: data);
                },
                child: Center(
                  child: TextMeta('Gunakan Lokasi', color: Colors.white,),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  headerTitle(){
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
              color: Colors.blue
          )
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search, color: Colors.grey,),
          SizedBox(width: 10),
          Expanded(
              child: TextFormField(
                style: TextStyle(color: Colors.grey.shade300, fontSize: 13),
                // style: TStyleRevamp.regular.copyWith(color: ColorRevamp.darkGrey3, fontSize: 13),
                controller: controller.edtSearch,
                textInputAction: TextInputAction.search,
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText:
                  'Cari Lokasi jalan / perumahan / gedung',
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                  contentPadding: EdgeInsets.only(bottom: 10)
                ),
              )
          ),
        ],
      ),

    );
  }

  Future<void> cameraMove(CameraPosition cameraPosition) async {
    final GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    controller.changeLatLon(cameraPosition.target.latitude, cameraPosition.target.longitude);
    // controller.currentLatitude.value = cameraPosition.target.latitude;
    // controller.currentLongitude.value = cameraPosition.target.longitude;
    // List<Placemark> placemarks = await placemarkFromCoordinates(cameraPosition.target.latitude, cameraPosition.target.longitude);
    // print(placemarks);
    // Placemark place = placemarks[0];
    // controller.currentAddress.value = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    // controller.edtSearch.text = response.result.name;
    // Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

  }

  cameraIdle() async{
    List<Placemark> placemarks = await placemarkFromCoordinates(controller.currentLatitude.value, controller.currentLongitude.value);
    print(placemarks);
    Placemark place = placemarks[0];
    controller.currentAddress.value = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    // controller.edtSearch.text = response.result.name;
    // Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }
}
