import 'package:bloodbond_app/features/maps/screens/location_page.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String state;
  final double distance;

  LocationPageState lp = new LocationPageState();

  CustomCard({
    required this.name,
    required this.state,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 160,
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
                  lp.LocationMark(name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
