import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/widgets/header.dart';
import 'package:trackmate/ui/widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 80),
        child: const Column(
          children: [
            Column(
              children: [
                NotificationCard(
                    desc: "Your bike is 5 km away from the safe zone.",
                    date: '25/05/2024 16:00:03'),
                NotificationCard(
                    desc: "Your bike is out of the safe zone",
                    date: '25/05/2024 16:00:03')
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            content(),
            Header(
              color: purpleColor,
              type: false,
              text: 'Notification',
            ),
          ],
        ),
      ),
    );
  }
}
