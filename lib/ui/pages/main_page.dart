// Import Packages
import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/pages/home_page.dart';
import 'package:trackmate/ui/pages/report_page.dart';
import 'package:trackmate/ui/pages/tracker_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Current page state
  int currentIndex = 0;

  Widget customButtonNav() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      elevation: 32,
      currentIndex: currentIndex,
      onTap: (value) {
        setState(() {
          if (value == 2) {
            return;
          }
          currentIndex = value;
        });
      },
      selectedLabelStyle: purpleText.copyWith(
        fontSize: 12,
        fontWeight: regular,
        height: 2,
      ),
      unselectedLabelStyle: darkGreyText.copyWith(
        fontSize: 12,
        fontWeight: regular,
        height: 2,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            child: Icon(
              Icons.home_outlined,
              color: currentIndex == 0 ? purpleColor : darkGreyColor,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            child: Icon(
              Icons.gps_fixed_outlined,
              color: currentIndex == 1 ? purpleColor : darkGreyColor,
            ),
          ),
          label: 'Tracker',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            child: Icon(
              Icons.person_outline_outlined,
              color: currentIndex == 2 ? purpleColor : darkGreyColor,
            ),
          ),
          label: 'Account',
        ),
      ],
    );
  }

  Widget rendererPage() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const TrackerPage();
      case 2:
        return const ReportPage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customButtonNav(),
      body: rendererPage(),
    );
  }
}
