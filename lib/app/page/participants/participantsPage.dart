import 'package:fic_clientes/app/util/responsive.dart';
import 'package:fic_clientes/data/services.dart';
import 'package:flutter/material.dart';

class ParticipantsPageScreen extends StatefulWidget {
  const ParticipantsPageScreen({Key? key}) : super(key: key);

  @override
  State<ParticipantsPageScreen> createState() => _ParticipantsPageScreenState();
}

class _ParticipantsPageScreenState extends State<ParticipantsPageScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Services services = Services();
  List? dataParticipants = [];

  Future<void> data() async {
    dataParticipants = await services.ParticipantsFic(_scaffoldKey);
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
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          backgroundColor: Color(0XFFB49948),
          color: Colors.white,
          displacement: 20.0,
          strokeWidth: 2,
          onRefresh: data,
          child: dataParticipants?.length !=0 ?Container(
            padding: EdgeInsets.only(right: 20, left: 20),
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
                      return Column(
                        children: [
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
                                        Text(dataParticipants?[i]['nombre'],
                                            style: TextStyle(
                                                fontSize: responsive.dp(1.63),
                                                color: Color(0XFF12121D),
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(
                                          height: responsive.hp(0.5),
                                        ),
                                        Text(dataParticipants?[i]['direccion'],
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
                      );
                    }),
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
