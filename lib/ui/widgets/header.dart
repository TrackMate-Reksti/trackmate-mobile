import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';

class Header extends StatelessWidget {
  const Header(
      {super.key, required this.color, this.type = true, required this.text});

  final Color color;
  final bool type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        height: type
            ? MediaQuery.of(context).size.height * 0.36
            : MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back_ios_outlined,
              color: whiteColor,
            ),
            Text(
              text,
              style: whiteText.copyWith(fontSize: 24, fontWeight: bold),
            ),
            Icon(
              Icons.edit,
              color: whiteColor,
            )
          ],
        ));
  }
}
