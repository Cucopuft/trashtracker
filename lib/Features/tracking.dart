import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation = LatLng(25.1193, 55.3773);
//position now

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  late GoogleMapController _mapController;

  Map<String, Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tracking',
          ),
          backgroundColor: const Color(0xff1DA48C),
        ),
        body: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: currentLocation,
            //target position
            zoom: 20,
          ),
          onMapCreated: (controller) {
            _mapController = controller;
            addMarker('test', currentLocation);
            addMarker('Purbalingga', const LatLng(7.3885, 109.3566));
            addMarker('Banyumas', const LatLng(-7.51417, 109.29417));
          },
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }

  addMarker(String id, LatLng location) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/truck.png',
    );

    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: 'Nama tempat',
        snippet: 'deskripsi tempat',
      ),
      icon: markerIcon,
    );

    _markers[id] = marker;
    setState(() {});
  }
}
