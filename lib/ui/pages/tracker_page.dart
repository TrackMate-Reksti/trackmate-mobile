import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackmate/models/motocycle_model.dart';
import 'package:trackmate/models/user_model.dart';
import 'package:trackmate/shared/theme.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  final Completer<GoogleMapController?> _mapsController = Completer();
  final Stream<DocumentSnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance
          .collection('users')
          .doc('ATc7ZHO6c7W8OwA58PpegtD3LGj2')
          .snapshots();
  String selectedMotocycle = 'All';
  List<MotocycleModel> motoCycles = [];
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _usersStream.listen((snapshot) {
      if (snapshot.data() != null) {
        UserModel user = UserModel.fromJson(snapshot.data()!, snapshot.id);
        motoCycles = user.motocycles;
        _updateMarkers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: _usersStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'Something went wrong',
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: darkGreyColor,
              )),
            );
          }

          UserModel? user;
          List<DropdownMenuItem> dropdownItems = [];
          if (snapshot.data!.data() != null) {
            user =
                UserModel.fromJson(snapshot.data!.data()!, snapshot.data!.id);
            motoCycles = user.motocycles;
            dropdownItems = motoCycles
                .map((x) => DropdownMenuItem(
                      value: x.platNumber,
                      child: Text(x.platNumber),
                    ))
                .toList();
            dropdownItems.insert(
              0,
              const DropdownMenuItem<String>(
                value: 'All',
                child: Text(
                  'All',
                ),
              ),
            );
          }

          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            floatingActionButton: FloatingActionButton(
              heroTag: UniqueKey(),
              backgroundColor: purpleColor,
              child: Icon(
                Icons.gps_fixed,
                color: whiteColor,
              ),
              onPressed: () async {
                final GoogleMapController? controller =
                    await _mapsController.future;

                if (selectedMotocycle == 'All') {
                  double sumLat = 0;
                  double sumLong = 0;
                  for (var motoCycle in motoCycles) {
                    sumLat += motoCycle.lat;
                    sumLong += motoCycle.long;
                  }

                  controller?.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(sumLat / motoCycles.length,
                            sumLong / motoCycles.length),
                        zoom: 15,
                      ),
                    ),
                  );
                } else {
                  MotocycleModel selected = motoCycles.firstWhere(
                      (motoCycle) => motoCycle.platNumber == selectedMotocycle);
                  controller?.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(selected.lat, selected.long),
                        zoom: 16,
                      ),
                    ),
                  );
                }
              },
            ),
            body: SafeArea(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  GoogleMap(
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(-6.892267812573147, 107.61015355771369),
                      zoom: 16,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    markers: user == null ? {} : _markers,
                    onMapCreated: (GoogleMapController controller) {
                      if (!_mapsController.isCompleted) {
                        _mapsController.complete(controller);
                      }
                    },
                  ),
                  user == null
                      ? const SizedBox()
                      : Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(
                            20,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: whiteColor,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${user.name}\'s Motocyles Location',
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                margin: const EdgeInsets.only(top: 8),
                                height: 36,
                                decoration: BoxDecoration(
                                  color: purpleColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: DropdownButton(
                                  items: dropdownItems,
                                  onChanged: (value) {
                                    motoCycles = user!.motocycles;
                                    setState(() {
                                      selectedMotocycle = value.toString();
                                      _updateMarkers();
                                    });
                                  },
                                  value: selectedMotocycle,
                                  menuMaxHeight: 200,
                                  underline: const SizedBox(),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          );
        });
  }

  void _updateMarkers() {
    var filteredMotocycles = selectedMotocycle == 'All'
        ? motoCycles
        : motoCycles
            .where((motocycle) => motocycle.platNumber == selectedMotocycle)
            .toList();

    setState(() {
      _markers = filteredMotocycles.map(
        (motocycle) {
          return Marker(
            markerId: MarkerId(motocycle.platNumber),
            position: LatLng(motocycle.lat, motocycle.long),
          );
        },
      ).toSet();
    });
  }
}
