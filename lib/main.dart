import 'package:bloodbond_app/features/app/splash-screen/splash_screen.dart';
import 'package:bloodbond_app/features/user_auth/presentation/pages/Login_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCfVsu_mBGAgRzM9PkiwLMb1slncdPt0qo",
          appId: "1:837735829285:web:698e783895c0a7989ed4cc",
          messagingSenderId: "837735829285",
          projectId: "flutter-firebase-fb309"),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'flutter demo',
      home: SplashScreen(child: LoginPage()),
    );
  }
}
