import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trackmate/firebase_options.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/pages/login_page.dart';
import 'package:trackmate/ui/pages/main_page.dart';
import 'package:trackmate/ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: purpleColor),
        useMaterial3: true,
      ),
      // Init routes
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/main': (context) => const MainPage(),
      },
    );
  }
}
