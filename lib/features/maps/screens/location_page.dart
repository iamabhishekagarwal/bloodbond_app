import 'dart:async';

import 'package:bloodbond_app/const.dart';
import 'package:bloodbond_app/widgets/bottom-navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
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
  int currentPage = 1;
  Location _location = Location();
  Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  LatLng? _currentPosition;
  LatLng? _destinationPosition;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getLocationUpdates();
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
                target: _currentPosition!,
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
        if (widget.locationName != null) {
          _markLocation(widget.locationName!);
        }
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
        _destinationPosition = LatLng(location.latitude, location.longitude);
        setState(() {
          _markers.add(newLocationMarker);
        });
      } else {
        print('Location not found for $locationName');
      }
    } catch (e) {
      print('Error: $e');
    }
    getPolylinePoints().then((coordinates) => {
          print(coordinates),
        });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Google_maps_api,
      PointLatLng(_currentPosition!.latitude, _currentPosition!.longitude),
      PointLatLng(
          _destinationPosition!.latitude, _destinationPosition!.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    print("Inside polyline points");
    return polylineCoordinates;
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
