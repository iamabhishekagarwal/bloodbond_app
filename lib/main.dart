import 'package:bloodbond_app/features/community/screens/community_page.dart';
import 'package:bloodbond_app/features/home/controllers/fetch_dontaions.dart';
import 'package:bloodbond_app/features/home/screens/home_page.dart';
import 'package:bloodbond_app/features/maps/screens/location_page.dart';
import 'package:bloodbond_app/features/profile/screens/profile_page.dart';
import 'package:bloodbond_app/firebase_options.dart';
import 'package:bloodbond_app/repository/Authentication_Repository/authentication_repository.dart';
import 'package:bloodbond_app/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    Get.put<DonationRepository>(DonationRepository());
    Get.put(AuthenticationRepository());
  } catch (error) {
    print("Error initializing Firebase: $error");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NourishNet',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/location': (context) => LocationPage(),
        '/community': (context) => CommunityPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
