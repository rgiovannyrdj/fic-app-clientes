import 'package:fic_clientes/app/page/login.dart';
import 'package:fic_clientes/app/page/start_menu.dart';
import 'package:fic_clientes/app/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenn(),
    );
  }
}

class SplashScreenn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreennState();
  }
}

class SplashScreennState extends State<SplashScreenn> {

  String idUser = "";

  loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idUser = prefs.getString("idTransactionFic") ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: (idUser == '') ?LoginScreen() :StartMenuScreen(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/icon/logo_fic.png",
      backgroundColor: Colors.white,
    );
  }
}
