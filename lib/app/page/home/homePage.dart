import 'package:fic_clientes/app/util/responsive.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
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
                    Text("\$5,094.00",
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
                height: responsive.hp(22),
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
                            Text("1234354567",
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
                            Text("1234",
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
                          Text("17/10/2022 a las 15:00",
                              style: TextStyle(
                                  fontSize: responsive.dp(1.9),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: responsive.hp(1.5),
              ),
              Container(
                width: responsive.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Image.asset("assets/icon/image_festival.png"),
              ),
            ],
          ),
        ));
  }
}
