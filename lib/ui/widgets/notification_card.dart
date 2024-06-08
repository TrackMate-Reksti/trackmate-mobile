import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.desc, required this.date});

  final String desc;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.location_on_outlined),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Location',
                      style: blackText.copyWith(fontSize: 16, fontWeight: bold),
                    ),
                    Text(
                      date,
                      style: greyText.copyWith(fontSize: 12, fontWeight: bold),
                    ),
                  ],
                ),
                Text(
                  desc,
                  style: blackText.copyWith(fontSize: 14, fontWeight: regular),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
