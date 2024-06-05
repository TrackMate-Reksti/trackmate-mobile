import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/pages/login_page.dart';
import 'package:trackmate/ui/pages/splash_page.dart';

void main() {
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
        // '/main': (context) => const MainPage(),
        // '/start': (context) => const StartPage(),
      },
    );
  }
}
