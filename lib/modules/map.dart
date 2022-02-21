import 'package:areen/models/map_model/list_of_marks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import '../consts/consts_methods.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.675470896113055, 46.73753865337133),
    zoom: 17.5,
  );
  static CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(24.675626882472198, 46.73753865337133),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
    createMarker(context);
  }

  createMarker(context) {

    if (customIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
              configuration, 'assets/image/yreklive_1.png',)
          .then((icon) {
        setState(() {
          customIcon = icon;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    createMarker(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'خريطه عرين',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GoogleMap(
        onTap: (p) {
          print(p);
        },
        markers: {
          Marker(
            markerId: const MarkerId("mark2"),
            infoWindow: InfoWindow(
                title: "باندا",
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          content: Container(
                            height: 350,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/c/cd/Panda_Cub_from_Wolong%2C_Sichuan%2C_China.JPG',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('نحو حياة أفضل تمتلك شركة بنده أكبر سلسلة متاجر التجزئة في المملكة العربية السعودية وجمهورية مصر العربية، ويزورها ملايين من العملاء في كل عام.',
                                  style: GoogleFonts.almarai(
                                    fontSize: 18
                                  ),),
                                ),
                                FloatingActionButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Icon(Icons.clear),
                                  backgroundColor: Colors.red,
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }),
           // icon: customIcon,
            position: const LatLng(24.675626882472198, 46.73753865337133),
          )
        },
        mapType: MapType.satellite,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
