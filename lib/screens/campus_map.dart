import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CampusMapScreen extends StatefulWidget {
  @override
  _CampusMapScreenState createState() => _CampusMapScreenState();
}

class _CampusMapScreenState extends State<CampusMapScreen> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Campus Map")),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(0.313, 32.582),  // Add the appropriate coordinates for your campus
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId('campus_marker'),
            position: LatLng(0.313, 32.582),
            infoWindow: InfoWindow(title: "Campus Location"),
          ),
        },
      ),
    );
  }
}
