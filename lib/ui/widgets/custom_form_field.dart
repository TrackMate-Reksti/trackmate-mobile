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
    this.defaultValue = '',
  });

  final TextEditingController textController;
  final String hintText;
  final String label;
  final String validator;
  final bool isPassword;
  final String defaultValue;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != '') {
      widget.textController.text = widget.defaultValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: purpleText.copyWith(
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
        contentPadding: const EdgeInsets.all(16),
        label: Text(widget.label),
        labelStyle: darkGreyText.copyWith(
          fontWeight: regular,
        ),
        floatingLabelStyle: purpleText.copyWith(
          fontWeight: medium,
        ),
        hintText: widget.hintText,
        hintStyle: darkGreyText.copyWith(
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
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: darkGreyColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: purpleColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: redColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
