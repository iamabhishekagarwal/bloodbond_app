import 'dart:async';

import 'package:bloodbond_app/features/community/screens/community_page.dart';
import 'package:bloodbond_app/features/home/screens/home_page.dart';
import 'package:bloodbond_app/features/profile/screens/profile_page.dart';
import 'package:bloodbond_app/widgets/bottom-navbar.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  final String? name;
  const LocationPage({Key? key, this.name}) : super(key: key);
  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  Set<Marker> markers = {};
  double? Latitude;
  double? Longitude;

  Map<PolylineId, Polyline> polylines = {};
  LatLng? _currentP = null;

  int currentPage = 1;
  @override
  void initState() {
    super.initState();
    getLocationUpdates();
    if (widget.name != null) {
      LocationMark(widget.name!);
    }
    // .then(
    //   (_) => {
    //     getPolylinePoints().then((coordinates) => {
    //           print(coordinates),
    //         }),
    //   },
    // );
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
      body: _currentP == null
          ? Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  _mapController.complete(controller)),
              initialCameraPosition:
                  CameraPosition(target: _pGooglePlex, zoom: 13),
              markers: {
                Marker(
                    markerId: MarkerId("_currentLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentP!),
                Marker(
                    markerId: MarkerId("_sourceLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGooglePlex),
                Marker(
                    markerId: MarkerId("_destinationLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pApplePark),
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
        )
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 13);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }
    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        Marker newMarker1 = Marker(
          markerId: MarkerId("_userLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position:
              LatLng(currentLocation.latitude!, currentLocation.longitude!),
        );
        setState(() {
          markers.add(newMarker1);

          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  void LocationMark(String name1) async {
    try {
      // Use geocoding to get the location coordinates by searching for the name
      List<geo.Location> locations = await geo.locationFromAddress(name1);
      print("Randi");
      if (locations.isNotEmpty) {
        geo.Location location = locations.first;
        print(LatLng(location.latitude, location.longitude));
        Marker newMarker = Marker(
          markerId: MarkerId("_newLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(location.latitude, location.longitude),
        );
        setState(() {
          print("Abhishek");
          _currentP = LatLng(location.latitude, location.longitude);
          markers.add(newMarker);
        });
      } else {
        print('Location not found for $name1');
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
