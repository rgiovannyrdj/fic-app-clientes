import 'package:fic_clientes/app/page/start_menu.dart';
import 'package:fic_clientes/app/util/responsive.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: responsive.hp(8)),
                Image.asset("assets/icon/icon_login.png", height: responsive.hp(8.7),),
                SizedBox(height: responsive.hp(2)),
                Text("App FIC", style: TextStyle(fontSize: responsive.dp(3.25), color: Color(0XFF12121D), fontWeight: FontWeight.w700)),
                SizedBox(height: responsive.hp(2)),
                Text("Te damos la bienvenida", style: TextStyle(fontSize: responsive.dp(1.9), color: Color(0XFF4D12121D), fontWeight: FontWeight.w700)),
                SizedBox(height: responsive.hp(7)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Número de tarjeta", style: TextStyle(fontSize: responsive.dp(1.63), color: Color(0XFF18191B), fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: responsive.hp(1)),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Ingresa últimos 6 dígitos de tarjeta",
                    hintStyle: TextStyle(fontSize: responsive.dp(1.63), color: Color(0XFF4D12121D), fontWeight: FontWeight.w400),
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
                  validator: (val) {
                    // if (val.length == 0) {
                    //   return "Email cannot be empty";
                    // } else {
                    //   return null;
                    // }
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: responsive.hp(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("PIN de la tarjeta", style: TextStyle(fontSize: responsive.dp(1.63), color: Color(0XFF18191B), fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: responsive.hp(1)),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "PIN de tarjeta",
                    hintStyle: TextStyle(fontSize: responsive.dp(1.63), color: Color(0XFF4D12121D), fontWeight: FontWeight.w400),
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
                  validator: (val) {
                    // if (val.length == 0) {
                    //   return "Email cannot be empty";
                    // } else {
                    //   return null;
                    // }
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: responsive.hp(8)),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => StartMenuScreen(),
                        ));
                  },
                  child: Container(
                    width: responsive.width,
                    height: responsive.hp(5.6),
                    decoration: BoxDecoration(
                      color: Color(0XFFC4C4C4),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("ENTRAR", style: TextStyle(fontSize: responsive.dp(1.9), color: Colors.white, fontWeight: FontWeight.w700))
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
