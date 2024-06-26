import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/widgets/custom_button.dart';

class ReportCard extends StatelessWidget {
  const ReportCard(
      {super.key,
      required this.name,
      required this.plat,
      required this.status});

  final String name;
  final String plat;
  final int status;

  void _showReportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('WARNING!',
              textAlign: TextAlign.center,
              style: redText.copyWith(fontSize: 32, fontWeight: bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Kendaraan di luar safe zone!\n\nKlik tombol di bawah untuk melapor via WhatsApp',
                textAlign: TextAlign.center,
                style: blackText.copyWith(fontSize: 20, fontWeight: regular),
              ),
              const SizedBox(height: 20),
              CustomButton(
                marginBottom: 0,
                marginTop: 8,
                buttonColor: redColor,
                buttonText: "Report",
                onPressed: () {},
                textStyle: whiteText,
                isLoading: false,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Image.asset(
            'assets/ninja.png',
            width: 120,
            height: 80,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
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
                      name,
                      style: blackText.copyWith(fontSize: 16, fontWeight: bold),
                    ),
                    Icon(
                      status == 1
                          ? Icons.check
                          : status == 2
                              ? Icons.event_note_outlined
                              : Icons.report,
                      color: status == 1
                          ? purpleColor
                          : status == 2
                              ? yellowColor
                              : redColor,
                    ),
                  ],
                ),
                Text(
                  plat,
                  style: darkGreyText.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  status == 1
                      ? "SAFE"
                      : status == 2
                          ? "REPORTED"
                          : "OUT OF SAFEZONE",
                  style: darkGreyText.copyWith(fontSize: 14, fontWeight: bold),
                ),
                if (status == 2)
                  CustomButton(
                    marginBottom: 0,
                    marginTop: 8,
                    buttonColor: greenColor,
                    buttonText: "Chat",
                    onPressed: () {},
                    textStyle: whiteText,
                    isLoading: false,
                  ),
                if (status == 3)
                  CustomButton(
                    marginBottom: 0,
                    marginTop: 8,
                    buttonColor: redColor,
                    buttonText: "Report",
                    onPressed: () {
                      _showReportDialog(context);
                    },
                    textStyle: whiteText,
                    isLoading: false,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
