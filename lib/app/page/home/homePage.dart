import 'dart:typed_data';

import 'package:fic_clientes/app/util/responsive.dart';
import 'package:fic_clientes/data/services.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Services services = Services();

  List? dataHome = [];
  Uint8List? image;
  String? numCardFic;

  Future<void> data() async {
    dataHome = await services.homeFic(context, _scaffoldKey);
    image = await services.homeImageFic(context, _scaffoldKey);
    final prefs = await SharedPreferences.getInstance();
    numCardFic = prefs.getString('numCardFic') ?? '';

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          backgroundColor: Color(0XFFB49948),
          color: Colors.white,
          displacement: 20.0,
          strokeWidth: 2,
          onRefresh: data,
          child: dataHome?.length != 0 && image?.length != 0
              ? Container(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Tu tarjeta",
                              style: TextStyle(
                                  fontSize: responsive.dp(1.43),
                                  color: Color(0XFF18191B),
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Container(
                        width: responsive.width,
                        height: responsive.hp(9),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0XFFF7F5F4),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "\$${dataHome![0]['saldo'].toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.9),
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                              height: responsive.hp(0.5),
                            ),
                            Text("Saldo",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.43),
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: responsive.hp(1.5),
                      ),
                      Container(
                        width: responsive.width,
                        height: responsive.hp(60),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(1.5, 1),
                            colors: <Color>[
                              Color(0xff100500),
                              Color(0xff686867),
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                            tileMode: TileMode.clamp,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${numCardFic}',
                                        style: TextStyle(
                                            fontSize: responsive.dp(1.9),
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700)),
                                    Text("Número",
                                        style: TextStyle(
                                            fontSize: responsive.dp(1.43),
                                            color: Color(0XFFD9D9D9),
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(
                                      height: responsive.hp(1),
                                    ),
                                    Text(
                                        '${dataHome![0]['referencia'].split('_')[0].trim()}',
                                        style: TextStyle(
                                            fontSize: responsive.dp(1.9),
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700)),
                                    Text("Folio",
                                        style: TextStyle(
                                            fontSize: responsive.dp(1.43),
                                            color: Color(0XFFD9D9D9),
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(
                                      height: responsive.hp(1),
                                    ),
                                    Text(
                                        '${dataHome![0]['referencia'].split('_')[1].trim()}',
                                        style: TextStyle(
                                            fontSize: responsive.dp(1.9),
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700)),
                                    Text("Subfolio",
                                        style: TextStyle(
                                            fontSize: responsive.dp(1.43),
                                            color: Color(0XFFD9D9D9),
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(
                                      height: responsive.hp(1),
                                    ),
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      "assets/icon/icon_target.png",
                                      width: responsive.wp(14.5),
                                    )
                                  ],
                                ))
                              ],
                            ),
                            Image.asset("assets/icon/line.png",
                                width: responsive.width),
                            SizedBox(
                              height: responsive.hp(0.5),
                            ),
                            Container(
                              width: responsive.width,
                              height: responsive.hp(6.2),
                              decoration: BoxDecoration(
                                color: Color(0XFF1AFFFFFF),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Vigencia",
                                      style: TextStyle(
                                          fontSize: responsive.dp(1.43),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      '${dataHome![0]['fechaFinVigencia'].split(' ')[0].trim()} a las ${dataHome![0]['fechaFinVigencia'].split(' ')[1].trim()}',
                                      style: TextStyle(
                                          fontSize: responsive.dp(1.9),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: responsive.hp(1.5),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0XFFF7F5F4),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: QrImageView(
                                  data: '${numCardFic}',
                                  version: QrVersions.auto,
                                  size: 200.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: responsive.hp(1.5),
                      ),
                      Container(
                        width: responsive.width,
                        height: responsive.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: DecorationImage(
                                image: MemoryImage(image!), fit: BoxFit.fill)),
                      ),
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
}
