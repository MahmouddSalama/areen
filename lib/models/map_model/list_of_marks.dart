import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
BuildContext? context;
 BitmapDescriptor customIcon=BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
createMarker(context) {
  if (customIcon == null) {
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor.fromAssetImage(configuration, 'assets/image/yreklive_1.png')
        .then((icon) {
        customIcon = icon;
    });
  }
}

Set<Marker> marksList= {
  Marker(
    markerId: const MarkerId("mark1"),
    onTap: (){
      showDialog(context: context!, builder: (_){
        return AlertDialog(
          title: Text('بانا'),
        );
      });
    },
    infoWindow: const InfoWindow(
      title: "باندا",
    ),
    icon: customIcon,
    position: LatLng(37.43296265331129, -122.08832357078792),
  ),
  Marker(
    markerId: const MarkerId("mark2"),
    infoWindow: const InfoWindow(
      title: "الاسد",
    ),
    icon: customIcon,
    position: const LatLng(37.43296265331129, -122.08832357078792),
  )
};