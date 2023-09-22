import 'dart:io';

import 'package:fic_clientes/app/util/responsive.dart';
import 'package:fic_clientes/data/services.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class ParticipantsPageScreen extends StatefulWidget {
  const ParticipantsPageScreen({Key? key}) : super(key: key);

  @override
  State<ParticipantsPageScreen> createState() => _ParticipantsPageScreenState();
}

class _ParticipantsPageScreenState extends State<ParticipantsPageScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Services services = Services();
  List? dataParticipants = [];
  bool serviceEnabled = false;
  LocationPermission? permission;
  Position? position;
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  Location location = Location();

  Future<void> data() async {
    dataParticipants = await services.ParticipantsFic(context, _scaffoldKey);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
    getLoc();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          backgroundColor: const Color(0XFFB49948),
          color: Colors.white,
          displacement: 20.0,
          strokeWidth: 2,
          onRefresh: data,
          child: dataParticipants?.length != 0
              ? Container(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: dataParticipants?.length,
                          itemBuilder: (BuildContext context, int i) {
                            double distance = position != null
                                ? Geolocator.distanceBetween(
                                    position!.latitude,
                                    position!.longitude,
                                    double.parse(dataParticipants?[i]['latitud']
                                        .toStringAsFixed(6)),
                                    double.parse(dataParticipants?[i]
                                            ['longitud']
                                        .toStringAsFixed(6)))
                                : 0.0;
                            double distanceKm = distance / 1000;
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Image.asset(
                                            "assets/icon/food.png")),
                                    Expanded(
                                        flex: 9,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  dataParticipants?[i]
                                                      ['nombre'],
                                                  style: TextStyle(
                                                      fontSize:
                                                          responsive.dp(1.63),
                                                      color: Color(0XFF12121D),
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              SizedBox(
                                                height: responsive.hp(0.5),
                                              ),
                                              Text(
                                                  dataParticipants?[i]
                                                      ['direccion'],
                                                  style: TextStyle(
                                                      fontSize:
                                                          responsive.dp(1.63),
                                                      color:
                                                          Color(0XFFB312121D),
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                                onTap: () async {
                                                  if (Platform.isAndroid) {
                                                    await launchUrl(
                                                        Uri.parse(
                                                            "https://www.google.com/maps/search/?api=1&query=${dataParticipants?[i]['latitud'].toStringAsFixed(6)},${dataParticipants?[i]['longitud'].toStringAsFixed(6)}"),
                                                        mode: LaunchMode
                                                            .externalApplication);
                                                  } else {
                                                    await launchUrl(
                                                        Uri.parse(
                                                            "https://maps.apple.com/?q=${dataParticipants?[i]['latitud'].toStringAsFixed(6)},${dataParticipants?[i]['longitud'].toStringAsFixed(6)}"),
                                                        mode: LaunchMode
                                                            .externalApplication);
                                                  }
                                                },
                                                child: const Icon(
                                                  Icons.location_on,
                                                  color: Color(0XFFB49948),
                                                ))
                                          ],
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: responsive.hp(1),
                                ),
                                Row(
                                  children: [
                                    Expanded(flex: 2, child: Container()),
                                    Expanded(
                                        flex: 9,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 7,
                                                    right: 7,
                                                    top: 1,
                                                    bottom: 1),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            Color(0XFFC4C4C4)),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)),
                                                    color: const Color(
                                                        0XFFF7F5F4)),
                                                child: Text(
                                                    distanceKm != 0.0
                                                        ? '${distanceKm.toStringAsFixed(1)} km'
                                                        : 'Activar ubicación',
                                                    style: TextStyle(
                                                        fontSize:
                                                            responsive.dp(1.63),
                                                        color:
                                                            Color(0XFF12121D),
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              )
                                            ],
                                          ),
                                        )),
                                    Expanded(flex: 1, child: Container())
                                  ],
                                ),
                                SizedBox(
                                  height: responsive.hp(3),
                                ),
                              ],
                            );
                          }),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            CircularProgressIndicator(
                              color: Color(0XFFB49948),
                            )
                          ],
                        )
                      ],
                    ))
                  ],
                ),
        ));
  }

  getLoc() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    position = await Geolocator.getCurrentPosition();
    setState(() {});
  }
}
