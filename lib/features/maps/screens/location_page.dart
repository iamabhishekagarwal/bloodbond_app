import 'dart:async';

import 'package:bloodbond_app/widgets/bottom-navbar.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  final String? locationName;
  const LocationPage({Key? key, this.locationName}) : super(key: key);

  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  int currentPage = 2;
  Location _location = Location();
  Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _defaultLocation = LatLng(37.4223, -122.0848);
  LatLng? _currentPosition;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getLocationUpdates();
    if (widget.locationName != null) {
      _markLocation(widget.locationName!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 168, 105),
        title: Text(
          'NourishNet',
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      body: _currentPosition == null
          ? Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  _mapController.complete(controller)),
              initialCameraPosition: CameraPosition(
                target: _defaultLocation,
                zoom: 13,
              ),
              markers: Set<Marker>.of(_markers),
            ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }

  Future<void> _moveCameraToPosition(LatLng position) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newPosition = CameraPosition(target: position, zoom: 13);
    await controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  Future<void> _getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        Marker newUserLocation = Marker(
          markerId: MarkerId("_userLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position:
              LatLng(currentLocation.latitude!, currentLocation.longitude!),
        );
        setState(() {
          _markers.add(newUserLocation);
          _currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _moveCameraToPosition(_currentPosition!);
        });
      }
    });
  }

  void _markLocation(String locationName) async {
    try {
      List<geo.Location> locations =
          await geo.locationFromAddress(locationName);
      if (locations.isNotEmpty) {
        geo.Location location = locations.first;
        Marker newLocationMarker = Marker(
          markerId: MarkerId("_newLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(location.latitude, location.longitude),
        );
        setState(() {
          _currentPosition = LatLng(location.latitude, location.longitude);
          _moveCameraToPosition(_currentPosition!);
          _markers.add(newLocationMarker);
        });
      } else {
        print('Location not found for $locationName');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
