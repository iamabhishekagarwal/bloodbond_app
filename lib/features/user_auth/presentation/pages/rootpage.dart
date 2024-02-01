import 'package:bloodbond_app/features/user_auth/presentation/pages/map_page.dart';
import 'package:bloodbond_app/features/user_auth/presentation/pages/profile_page.dart';
import 'package:bloodbond_app/notification_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.foregroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.isRefreshToken();
    notificationServices.getDeviceToken().then((value) {
      print("Device Token $value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nourished"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person), // Add your action icon here
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Editprofile();
                  },
                ),
              );
            },
          ),
        ],
      ),
      // body: const Homepage(),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "home"),
          NavigationDestination(
            icon: Icon(Icons.location_on_outlined),
            label: "location",
          ),
          NavigationDestination(icon: Icon(Icons.groups), label: "community"),
          NavigationDestination(
              icon: Icon(Icons.person_2_outlined), label: "profile")
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
            if (index == 1) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                  (route) => false);
            }
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
