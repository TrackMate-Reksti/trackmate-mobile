import 'package:flutter/material.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/widgets/custom_button.dart';
import 'package:trackmate/ui/widgets/custom_form_field.dart';
import 'package:trackmate/ui/widgets/header.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController addressController =
      TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    Widget content() {
      return ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: whiteColor,
                  radius: 40,
                  backgroundImage: const AssetImage('assets/logo.png'),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomFormField(
                  textController: nameController,
                  hintText: 'Your name',
                  label: 'Name',
                  validator: 'Please input your name',
                  defaultValue: 'Akmal Natha',
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomFormField(
                  textController: emailController,
                  hintText: 'Your email',
                  label: 'Email',
                  validator: 'Please input your email',
                  defaultValue: 'akmalnatha@gmail.com',
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomFormField(
                  textController: addressController,
                  hintText: 'Your address',
                  label: 'Address',
                  validator: 'Please input your address',
                  defaultValue: 'Jalan Sekeloa, Coblong, Bandung',
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomFormField(
                  textController: phoneController,
                  hintText: 'Your Phone Number',
                  label: 'Phone Number',
                  validator: 'Please input your phone numnber',
                  defaultValue: '08133312612',
                ),
                CustomButton(
                    marginBottom: 20,
                    marginTop: 80,
                    buttonColor: purpleColor,
                    buttonText: 'Save',
                    textStyle: whiteText,
                    onPressed: () {}),
                CustomButton(
                    buttonColor: redColor,
                    buttonText: 'Log Out',
                    textStyle: whiteText,
                    onPressed: () {}),
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
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
