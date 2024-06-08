import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/widgets/custom_form_field.dart';

import '../../providers/auth_provider.dart';
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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    void handleRegister() async {
      try {
        if (await authProvider.signUp(
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          name: nameController.text,
        )) {
          navigator.pushNamedAndRemoveUntil('/main', (route) => false);
        }
      } catch (e) {
        scaffoldMessenger.showSnackBar(SnackBar(
          content: Text(e.toString()),
          backgroundColor: redColor,
        ));
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right:20, left: 20, top: 80),
            child: Column(
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
                  onPressed: handleRegister,
                  textStyle: whiteText,
                  isLoading: authProvider.isLoading,
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
      ),
    );
  }
}
