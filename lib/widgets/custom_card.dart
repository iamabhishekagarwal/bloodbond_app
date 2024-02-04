import 'package:bloodbond_app/features/maps/screens/location_page.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String name;
  final String state;
  final double distance;
  final LocationPageState locationPageState;

  CustomCard({
    required this.name,
    required this.state,
    required this.distance,
    required this.locationPageState,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 100,
        child: SingleChildScrollView(
          child: Card(
            elevation: 3,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'State: ${widget.state}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Distance: ${widget.distance.toString()} km',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
  onTap: () {
    widget.locationPageState.locationMark(widget.name);
  },
),

                ],
              ),
            ),
          ),
        ),
      );
  }
}
