import 'package:fic_clientes/app/util/responsive.dart';
import 'package:flutter/material.dart';

class MovementsPageScreen extends StatefulWidget {
  const MovementsPageScreen({Key? key}) : super(key: key);

  @override
  State<MovementsPageScreen> createState() => _MovementsPageScreenState();
}

class _MovementsPageScreenState extends State<MovementsPageScreen> {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Saldo",
                                    style: TextStyle(
                                        fontSize: responsive.dp(1.43),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  height: responsive.hp(0.5),
                                ),
                                Text("\$5,094.00",
                                    style: TextStyle(
                                        fontSize: responsive.dp(1.9),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Vig. 31 oct 2022",
                                    style: TextStyle(
                                        fontSize: responsive.dp(1.43),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                                Text("15:00",
                                    style: TextStyle(
                                        fontSize: responsive.dp(1.43),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: responsive.hp(3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Del 01 oct al 31 oct 2022",
                      style: TextStyle(
                          fontSize: responsive.dp(1.43),
                          color: Color(0XFF18191B),
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(
                height: responsive.hp(3),
              ),
              Row(
                children: [
                  Expanded(flex: 2, child: Image.asset("assets/icon/card.png")),
                  Expanded(
                      flex: 7,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Restaurate Edelmira",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFF12121D),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: responsive.hp(0.5),
                            ),
                            Text("13/10/2022 * Pagada",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFFB312121D),
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("-\$100.00",
                              style: TextStyle(
                                  fontSize: responsive.dp(1.63),
                                  color: Color(0XFFB312121D),
                                  fontWeight: FontWeight.w400)),
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
              Row(
                children: [
                  Expanded(flex: 2, child: Image.asset("assets/icon/card.png")),
                  Expanded(
                      flex: 7,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Restaurate Edelmira",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFF12121D),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: responsive.hp(0.5),
                            ),
                            Text("13/10/2022 * Pagada",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFFB312121D),
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("-\$80.00",
                              style: TextStyle(
                                  fontSize: responsive.dp(1.63),
                                  color: Color(0XFFB312121D),
                                  fontWeight: FontWeight.w400)),
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
              Row(
                children: [
                  Expanded(flex: 2, child: Image.asset("assets/icon/card.png")),
                  Expanded(
                      flex: 7,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Restaurate Edelmira",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFF12121D),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: responsive.hp(0.5),
                            ),
                            Text("12/10/2022 * Cancelada",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFFB312121D),
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("-\$50.00",
                              style: TextStyle(
                                  fontSize: responsive.dp(1.63),
                                  color: Color(0XFFB312121D),
                                  fontWeight: FontWeight.w400)),
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
            ],
          ),
        ));
  }
}
