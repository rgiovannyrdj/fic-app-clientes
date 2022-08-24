import 'package:fic_clientes/app/util/responsive.dart';
import 'package:flutter/material.dart';

class ParticipantsPageScreen extends StatefulWidget {
  const ParticipantsPageScreen({Key? key}) : super(key: key);

  @override
  State<ParticipantsPageScreen> createState() => _ParticipantsPageScreenState();
}

class _ParticipantsPageScreenState extends State<ParticipantsPageScreen> {
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
                children: [
                  Expanded(flex: 2, child: Image.asset("assets/icon/food.png")),
                  Expanded(
                      flex: 10,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Atrio Resto Bistro Bar",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFF12121D),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: responsive.hp(0.5),
                            ),
                            Text("Ágora del Baratillo s/n, Col. Centro",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFFB312121D),
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
              Row(
                children: [
                  Expanded(flex: 2, child: Image.asset("assets/icon/food.png")),
                  Expanded(
                      flex: 10,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bar tradicional Luna",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFF12121D),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: responsive.hp(0.5),
                            ),
                            Text("Jardín de la Unión No. 10, Zona Centro",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFFB312121D),
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
              Row(
                children: [
                  Expanded(flex: 2, child: Image.asset("assets/icon/food.png")),
                  Expanded(
                      flex: 10,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Corazón Mexicano (Sucursal San Javier)",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFF12121D),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: responsive.hp(0.5),
                            ),
                            Text("Carr. Panorámica Carrizo San Javier s/n Col. San Javier",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFFB312121D),
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: responsive.hp(2),
              ),
              Row(
                children: [
                  Expanded(flex: 2, child: Image.asset("assets/icon/food.png")),
                  Expanded(
                      flex: 10,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Comedor Real (Hotel Castillo Santa Cecilia)",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFF12121D),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: responsive.hp(0.5),
                            ),
                            Text("Salida a Dolores Hidalgo y Carr.a la Valenciana, Col. San Javier",
                                style: TextStyle(
                                    fontSize: responsive.dp(1.63),
                                    color: Color(0XFFB312121D),
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )),
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
