import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Init state to fetch the application data when start the apps
  getInit() async {
    Timer(const Duration(seconds: 3), () async {
      Navigator.pushNamed(context, '/main');
    });
  }

  @override
  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 24,
              ),
              width: 130,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            Text(
              'Curanmore?\nNo More',
              textAlign: TextAlign.center,
              style: whiteText.copyWith(
                fontSize: 40,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
