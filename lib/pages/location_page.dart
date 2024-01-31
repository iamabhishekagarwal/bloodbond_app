import 'package:bloodbond_app/pages/community_page.dart';
import 'package:bloodbond_app/pages/home_page.dart';
import 'package:bloodbond_app/pages/profile_page.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  int currentPage = 1;

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
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(255, 198, 168, 105),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "home"),
          NavigationDestination(
              icon: Icon(Icons.location_on_outlined), label: "location"),
          NavigationDestination(icon: Icon(Icons.groups), label: "community"),
          NavigationDestination(
              icon: Icon(Icons.person_2_outlined), label: "profile")
        ],
        onDestinationSelected: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CommunityPage(),
                ),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
              break;
          }
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
