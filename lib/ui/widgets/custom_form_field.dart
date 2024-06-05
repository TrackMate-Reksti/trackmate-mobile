import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.label,
    required this.validator,
    this.isPassword = false,
  });

  final TextEditingController textController;
  final String hintText;
  final String label;
  final String validator;
  final bool isPassword;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: purpleText.copyWith(
        fontSize: 12,
        fontWeight: regular,
      ),
      obscureText: widget.isPassword ? isObscure : false,
      obscuringCharacter: '*',
      cursorColor: purpleColor,
      validator: (e) {
        if (e!.isEmpty) {
          return widget.validator;
        }
        return null;
      },
      controller: widget.textController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        label: Text(widget.label),
        labelStyle: darkGreyText.copyWith(
          fontSize: 12,
          fontWeight: regular,
        ),
        floatingLabelStyle: purpleText.copyWith(
          fontSize: 14,
          fontWeight: medium,
        ),
        hintText: widget.hintText,
        hintStyle: darkGreyText.copyWith(
          fontSize: 12,
          fontWeight: regular,
        ),
        suffixIcon: Visibility(
          visible: widget.isPassword,
          child: IconButton(
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            icon: Icon(
              isObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: darkGreyColor,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: darkGreyColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: purpleColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: redColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
