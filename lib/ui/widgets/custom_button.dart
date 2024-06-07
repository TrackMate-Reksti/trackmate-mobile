import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color buttonColor;
  final TextStyle textStyle;
  final double marginTop;
  final double marginBottom;
  final IconData? icon;
  final bool isLoading;

  const CustomButton(
      {super.key,
      required this.buttonColor,
      required this.buttonText,
      required this.textStyle,
      required this.onPressed,
      this.marginTop = 0,
      this.marginBottom = 0,
      this.icon,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            Visibility(
              visible: isLoading,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            Visibility(
              visible: icon != null || isLoading,
              child: const SizedBox(width: 8),
            ),
            Text(
              buttonText,
              style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
