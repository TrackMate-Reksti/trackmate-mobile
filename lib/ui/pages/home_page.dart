import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trackmate/models/user_model.dart';
import 'package:trackmate/shared/theme.dart';
import 'package:trackmate/ui/pages/add_vehicle_page.dart';
import 'package:trackmate/ui/pages/notification_page.dart';
import 'package:trackmate/ui/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot<Map<String, dynamic>>> usersStream =
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: usersStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text(
                              'Something went wrong',
                            ),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: darkGreyColor,
                            ),
                          );
                        }

                        UserModel? user;
                        if (snapshot.data!.data() != null) {
                          user = UserModel.fromJson(
                              snapshot.data!.data()!, snapshot.data!.id);
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Badge(
                                  label: const Text('2'),
                                  smallSize: 0,
                                  largeSize: 24,
                                  child: IconButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NotificationPage()),
                                    ),
                                    icon: Icon(
                                      Icons.notifications_outlined,
                                      color: whiteColor,
                                      size: 36,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()),
                                  ),
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: whiteColor,
                                    foregroundImage: NetworkImage('https://ui-avatars.com/api/?name=${user?.name}+&color=7F9CF5&background=EBF4FF'),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Hi, ',
                                  style: whiteText.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  user!.name,
                                  style: whiteText.copyWith(
                                    fontSize: 24,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Welcome back to',
                              style: whiteText.copyWith(
                                fontSize: 24,
                                fontWeight: bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 8),
                            Image.asset('assets/logo.png', height: 80, fit: BoxFit.contain,),
                          ],
                        );
                      }),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Image.asset(
                    'assets/maskot.png',
                    height: 180,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Registered Motocycles",
                        style:
                            blackText.copyWith(fontSize: 16, fontWeight: bold),
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddVehiclePage()),
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(blackColor),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: whiteColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Add',
                              style: whiteText,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: usersStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text(
                              'Something went wrong',
                            ),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: darkGreyColor,
                            ),
                          );
                        }

                        UserModel? user;
                        if (snapshot.data!.data() != null) {
                          user = UserModel.fromJson(
                              snapshot.data!.data()!, snapshot.data!.id);
                        }

                        return Visibility(
                          visible: user != null,
                          child: Column(
                            children: user!.motocycles
                                .map(
                                  (x) => Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(20),
                                    margin: const EdgeInsets.only(top: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: whiteColor,
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/logo.png',
                                          height: 60,
                                          width: 60,
                                          color: purpleColor,
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                x.name,
                                                style: blackText.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: bold,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                x.platNumber,
                                                style: darkGreyText.copyWith(),
                                              )
                                            ],
                                          ),
                                        ),
                                        IconButton.filled(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    redColor),
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          icon: Icon(
                                            Icons.remove,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
