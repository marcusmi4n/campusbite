import 'package:flutter/material.dart';
import 'package:geofencing/geofencing.dart';
import 'package:location/location.dart';

class GeoFenceDetectionScreen extends StatefulWidget {
  @override
  _GeoFenceDetectionScreenState createState() => _GeoFenceDetectionScreenState();
}

class _GeoFenceDetectionScreenState extends State<GeoFenceDetectionScreen> {
  late LocationData _locationData;

  @override
  void initState() {
    super.initState();
    _startGeoFencing();
  }

  void _startGeoFencing() async {
    final location = Location();
    _locationData = await location.getLocation();
    // Implement geo-fencing logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Geo-fence Detection")),
      body: Center(
        child: Text("Geo-fence is active!"),
      ),
    );
  }
}
