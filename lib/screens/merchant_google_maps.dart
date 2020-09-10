import 'dart:async';

import 'package:amex_growthhack/widgets/models/Merchant.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MerchantGoogleMapsScreen extends StatefulWidget {
  MerchantGoogleMapsScreen({ Key key }): super(key: key);

  @override
  _MerchantGoogleMapsScreenState createState() => _MerchantGoogleMapsScreenState();
}

class _MerchantGoogleMapsScreenState extends State<MerchantGoogleMapsScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.719333, -73.989977),
    zoom: 34.4746,
  );

  @override
  Widget build(BuildContext context) {

    final Merchant merchant = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: AppBar(
        title: Text(merchant.name),
        backgroundColor: const Color(0xFF031956),
      ),
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