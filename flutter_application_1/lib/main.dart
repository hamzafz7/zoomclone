import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/themes.dart';
import 'package:flutter_application_1/data/FireBaseAuthMethods/auth_methods.dart';
import 'package:flutter_application_1/presentation/screens/home_screen.dart';
import 'package:flutter_application_1/presentation/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/presentation/screens/video_call_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: apptheme,
      routes: {
        'login': (context) => const SignInScreen(),
        'home': (context) => HomeScreen(),
        'videocall': (context) => VideoScreen()
      },
      home: StreamBuilder(
        stream: AuthMethods.authchanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            print(snapshot.data);
            return HomeScreen();
          }
          return const SignInScreen();
        },
      ),
    );
  }
}
// SHA1: 98:5F:16:6A:0A:F4:C7:EA:74:64:56:3A:63:F5:B8:39:AC:A1:B4:A2
//SHA-256: 95:BE:0D:56:3E:2B:3A:CE:1B:0C:F8:6C:04:D9:E6:D6:D3:10:26:E8:47:02:2D:17:FC:17:A4:8B:F1:21:ED:99