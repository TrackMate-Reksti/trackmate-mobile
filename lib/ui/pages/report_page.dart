// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/widgets/header.dart';
import 'package:trackmate/ui/widgets/report_card.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 72),
            child: const Column(
              children: [
                ReportCard(name: 'Kawasaki', plat: 'AB 2653 WX', status: 1),
                ReportCard(name: 'Kawasaki', plat: 'AB 2653 WX', status: 2),
                ReportCard(name: 'Kawasaki', plat: 'AB 2653 WX', status: 3),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          content(),
          Header(
            color: purpleColor,
            type: false,
            text: 'Report',
          ),
        ],
      ),
    );
  }
}
