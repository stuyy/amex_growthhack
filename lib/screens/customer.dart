import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomerScreen extends StatefulWidget {
  CustomerScreen({ Key key }): super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.7670169511878, -122.42184275),
    zoom: 64.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.7670169511878, -122.42184275),
      tilt: 59.440717697143555,
      zoom: 500);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: MarkerId(_kGooglePlex.toString()),
            position: _kGooglePlex.target,
            infoWindow: InfoWindow(
              title: 'Test',
            )
          )
        },
      ),
    );
  }
}