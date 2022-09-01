import 'package:fic_clientes/app/util/responsive.dart';
import 'package:fic_clientes/data/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovementsPageScreen extends StatefulWidget {
  const MovementsPageScreen({Key? key}) : super(key: key);

  @override
  State<MovementsPageScreen> createState() => _MovementsPageScreenState();
}

class _MovementsPageScreenState extends State<MovementsPageScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Services services = Services();
  String? saldoFic;
  String? dateFic;
  List? datatransaction = [];

  Future<void> data() async {
    final prefs = await SharedPreferences.getInstance();
    datatransaction = await services.TransactionFic(_scaffoldKey);
    saldoFic = prefs.getString('saldoFic') ?? '';
    dateFic = prefs.getString('dateFic') ?? '';
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
          child: datatransaction?.length != 0 ? Container(
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
                                  Text("\$${double.parse(saldoFic.toString()).toStringAsFixed(2)}",
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
                                  Text(dateFic.toString().split(' ')[0].trim(),
                                      style: TextStyle(
                                          fontSize: responsive.dp(1.43),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                  Text(dateFic.toString().split(' ')[1].trim(),
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
                    Text("Historial",
                        style: TextStyle(
                            fontSize: responsive.dp(1.43),
                            color: Color(0XFF18191B),
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                SizedBox(
                  height: responsive.hp(3),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: datatransaction?.length,
                  itemBuilder: (BuildContext context, int i){
                    return Column(
                      children: [
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
                                      Text(datatransaction?[i]['asignacion']['nombre'],
                                          style: TextStyle(
                                              fontSize: responsive.dp(1.63),
                                              color: Color(0XFF12121D),
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        height: responsive.hp(0.5),
                                      ),
                                      Text("${datatransaction?[i]['fecha']} * ${datatransaction?[i]['tipoTransaccion']['descripcion']}",
                                          style: TextStyle(
                                              fontSize: responsive.dp(1.46),
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
                                    Text("-\$${datatransaction?[i]['monto'].toStringAsFixed(2)}",
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
                    );
                  },
                ),
              ],
            ),
          ):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [CircularProgressIndicator(color: Color(0XFFB49948),)],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
