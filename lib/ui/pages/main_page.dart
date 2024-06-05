// Import Packages
import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/pages/home_page.dart';

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
            child: Image.asset(
              'assets/monitor_icon.png',
              color: currentIndex == 0 ? purpleColor : darkGreyColor,
              width: 21,
            ),
          ),
          label: 'Monitor',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            child: Image.asset(
              'assets/route_icon.png',
              color: currentIndex == 1 ? purpleColor : darkGreyColor,
              width: 20,
            ),
          ),
          label: 'Route',
        ),
        const BottomNavigationBarItem(
          icon: Visibility(
            visible: false,
            child: SizedBox(),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            child: Image.asset(
              'assets/report_icon.png',
              color: currentIndex == 3 ? purpleColor : darkGreyColor,
              width: 20,
            ),
          ),
          label: 'Report',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            child: Image.asset(
              'assets/account_icon.png',
              color: currentIndex == 4 ? purpleColor : darkGreyColor,
              width: 18,
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
        return const HomePage();
      case 2:
        return const HomePage();
      case 3:
        return const HomePage();
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
