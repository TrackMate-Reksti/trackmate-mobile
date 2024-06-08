import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackmate/providers/auth_provider.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/widgets/custom_form_field.dart';

import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    void handleLogin() async {
      try {
        if (await authProvider.signIn(
          email: emailController.text,
          password: passwordController.text,
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
            padding: const EdgeInsets.only(right: 20, left: 20, top: 80),
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
                  "Welocome Back",
                  style: blackText.copyWith(fontSize: 24, fontWeight: semibold),
                ),
                Text(
                  "Sign In to Countinue",
                  style: blackText.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 40),
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
                  buttonText: "Sign In",
                  onPressed: handleLogin,
                  textStyle: whiteText,
                  isLoading: authProvider.isLoading,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: darkGreyText,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Sign Up",
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
