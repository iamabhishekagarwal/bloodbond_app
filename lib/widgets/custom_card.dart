import 'package:bloodbond_app/features/maps/screens/location_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  LocationPageState lps = LocationPageState();
  final String name;
  final String state;
  final double distance;

  CustomCard({
    required this.name,
    required this.state,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 200,
        child: Card(
          elevation: 3,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'State: $state',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Distance: ${distance.toString()} km',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Maha Randi");
                    Get.to(() => LocationPage(
                          locationName: "$name",
                        ));
                  },
                  child: Text(
                    'Tap here',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}