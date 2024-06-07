import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/widgets/custom_form_field.dart';

import '../widgets/custom_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController confirmPasswordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 60,
                color: blackColor,
              ),
              const SizedBox(height: 16),
              Text(
                "Create an Account",
                style: blackText.copyWith(fontSize: 24, fontWeight: semibold),
              ),
              Text(
                "Enter your email to sign up for this app",
                style: blackText.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 40),
              CustomFormField(
                hintText: 'Your Fullname',
                textController: nameController,
                label: 'Fullname',
                validator: 'Fullname Required',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormField(
                hintText: 'Your Email',
                textController: emailController,
                label: 'Email',
                validator: 'Email Required',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormField(
                hintText: 'Confirm Your Password',
                textController: confirmPasswordController,
                label: 'Confirm Password',
                validator: 'Confirm Password Required',
                isPassword: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormField(
                hintText: 'Your Password',
                textController: passwordController,
                label: 'Password',
                validator: 'Password Required',
                isPassword: true,
              ),
              CustomButton(
                marginBottom: 12,
                marginTop: 32,
                buttonColor: purpleColor,
                buttonText: "Sign Up",
                onPressed: () {},
                textStyle: whiteText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You have an account?",
                    style: darkGreyText,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Sign In",
                      style: purpleText.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
