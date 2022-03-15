import 'package:areen/consts/colors.dart';
import '../models/animal/animal_dialog.dart';
import 'package:areen/models/map_model/list_of_marks.dart';
import 'package:areen/models/map_model/mao_model.dart';
import 'package:areen/modules/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import '../consts/consts_methods.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  BitmapDescriptor? customIcon;

  late GoogleMapController _controller;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.678409982534646, 46.736595900265094),
    zoom: 18.5,
  );
  static CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(24.678409982534646, 46.736595900265094),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  List<Marker> list = [];
  int chose = -1;

  void dispose() {
    // TODO: implement dispose
    list = [];
    chose=-1;
    setState(() {

    });
    super.dispose();
  }


  createMarker(context) async {
    ImageConfiguration configuration =
        const ImageConfiguration(size: Size(1, 1));
    for (int i = 0; i < mapModelList.length; i++) {
      print(i);
      list.add(Marker(
        onTap: (){
          print("sd");
          setState(() {
            chose = i;
          });
        },
          markerId: MarkerId(mapModelList[i].desc),
          position: mapModelList[i].latLng,
          icon: await BitmapDescriptor.fromAssetImage(
            configuration,
            'assets/image/marks/${i + 1}.png',
          )));
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    createMarker(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'خريطه عرين',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onTap: (p) {
              print(p);
            },
            markers: list.toSet(),
            mapType: MapType.satellite,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
          ),
          chose!=-1?Container(
            height: size.height,
            width: size.width,
            child: Center(
              child: Container(
                width: 300,
                height: 450,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 300,
                      color: Colors.green,
                      child: Image.network(animalDialog[chose].image,fit: BoxFit.cover,),
                    ),
                     Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(animalDialog[chose].string),
                    ),
                    FloatingActionButton(
                      child: Icon(Icons.clear),
                      backgroundColor: Kmaincolor,
                      onPressed: (){
                        chose=-1;
                        setState(() {
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ):SizedBox(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position position = await currentlocation();
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                zoom: 18.5,
                  target: LatLng(position.latitude, position.longitude))));
          list.add( Marker(markerId: MarkerId('currentPosotion'),
          position: LatLng(position.latitude, position.longitude)));
          setState(() {});
        },
        child: Icon(Icons.location_on),
        backgroundColor: Kmaincolor,
      ),
    );
  }

  Future<Position> currentlocation() async {
    bool serviceEnabeld;
    LocationPermission locationPermission;
    serviceEnabeld = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabeld) {
      return Future.error(' the location is not enabeld');
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return Future.error(' LocationPermission is denied');
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error(' LocationPermission deniedForever');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
