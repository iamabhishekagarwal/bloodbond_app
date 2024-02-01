import 'package:bloodbond_app/features/community/screens/community_page.dart';
import 'package:bloodbond_app/features/maps/screens/location_page.dart';
import 'package:bloodbond_app/features/profile/screens/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
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
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LocationPage(),
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
