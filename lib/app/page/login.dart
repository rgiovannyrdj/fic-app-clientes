import 'package:fic_clientes/app/util/responsive.dart';
import 'package:fic_clientes/data/services.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numCard = TextEditingController();
  TextEditingController pinCard = TextEditingController();
  int text1 = 0;
  int text2 = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Services services = Services();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: responsive.hp(8)),
                Image.asset(
                  "assets/icon/icon_login.png",
                  height: responsive.hp(8.7),
                ),
                SizedBox(height: responsive.hp(2)),
                Text("App FIC",
                    style: TextStyle(
                        fontSize: responsive.dp(3.25),
                        color: Color(0XFF12121D),
                        fontWeight: FontWeight.w700)),
                SizedBox(height: responsive.hp(2)),
                Text("Te damos la bienvenida",
                    style: TextStyle(
                        fontSize: responsive.dp(1.9),
                        color: Color(0XFF4D12121D),
                        fontWeight: FontWeight.w700)),
                SizedBox(height: responsive.hp(7)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Número de tarjeta",
                        style: TextStyle(
                            fontSize: responsive.dp(1.63),
                            color: Color(0XFF18191B),
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: responsive.hp(1)),
                TextFormField(
                  controller: numCard,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Ingresar dígitos de tarjeta",
                    hintStyle: TextStyle(
                        fontSize: responsive.dp(1.63),
                        color: Color(0XFF4D12121D),
                        fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0XFF333333),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0XFF333333),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  onChanged: (value){
                    text1 = value.length;
                    setState(() {});
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: responsive.hp(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("PIN de la tarjeta",
                        style: TextStyle(
                            fontSize: responsive.dp(1.63),
                            color: Color(0XFF18191B),
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: responsive.hp(1)),
                TextFormField(
                  controller: pinCard,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "PIN de tarjeta",
                    hintStyle: TextStyle(
                        fontSize: responsive.dp(1.63),
                        color: Color(0XFF4D12121D),
                        fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0XFF333333),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0XFF333333),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  onChanged: (value){
                    text2 = value.length;
                    setState(() {});
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: responsive.hp(8)),
                GestureDetector(
                  onTap: () {
                    if (numCard.text != '' && pinCard.text != '') {
                      services.loginFic(
                          context, _scaffoldKey, numCard.text, pinCard.text);
                    } else {
                      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                        content: Text('Ingrese número y pin de tarjeta.'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  child: Container(
                    width: responsive.width,
                    height: responsive.hp(5.6),
                    decoration: BoxDecoration(
                      color: (text1 != 0 && text2 != 0)?Color(0XFFB49948):Color(0XFFC4C4C4),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("ENTRAR",
                            style: TextStyle(
                                fontSize: responsive.dp(1.9),
                                color: Colors.white,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
