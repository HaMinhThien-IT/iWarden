import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iWarden/models/directions.dart';

class MapScreen extends StatefulWidget {
  final double screenHeight;
  final LatLng sourceLocation;
  final LatLng destination;
  final Directions? info;
  final Completer<GoogleMapController> mapController;

  const MapScreen({
    required this.screenHeight,
    required this.sourceLocation,
    required this.destination,
    required this.mapController,
    this.info,
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: widget.screenHeight,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              widget.mapController.complete(controller);
            },
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: widget.sourceLocation,
              zoom: 17,
            ),
            markers: {
              Marker(
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueAzure,
                ),
                markerId: const MarkerId("source"),
                position: widget.sourceLocation,
              ),
              Marker(
                markerId: const MarkerId("destination"),
                position: widget.destination,
              ),
            },
            polylines: {
              if (widget.info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.blue,
                  width: 6,
                  points: widget.info!.polylinePoints
                      .map((item) => LatLng(item.latitude, item.longitude))
                      .toList(),
                ),
            },
          ),
        ),
      ],
    );
  }
}
