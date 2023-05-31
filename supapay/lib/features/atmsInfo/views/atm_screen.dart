import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ATMInfo extends StatefulWidget {
  const ATMInfo({super.key});

  @override
  State<ATMInfo> createState() => _ATMInfoState();
}

class _ATMInfoState extends State<ATMInfo> {
  // ignore: unused_field
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    final hasPermission = await location.hasPermission();
    if (hasPermission == PermissionStatus.denied) {
      final permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    final currentLocation = await location.getLocation();
    setState(() {
      _currentLocation = currentLocation;
    });

    final lat = _currentLocation!.latitude!;
    final long = _currentLocation!.longitude!;
    _markers.add(
        Marker(markerId: const MarkerId('1'), position: LatLng(lat + 0.001, long - 0.001)));
    _markers.add(
        Marker(markerId: const MarkerId('2'), position: LatLng(lat - 0.001, long - 0.001)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Show ATMs"),
          ),
          body: _currentLocation != null
              ? GoogleMap(
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      _currentLocation!.latitude!,
                      _currentLocation!.longitude!,
                    ),
                    zoom: 15,
                  ),
                  onMapCreated: (controller) {
                    setState(() {
                      _controller = controller;
                    });
                  },
                  markers: _markers,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
