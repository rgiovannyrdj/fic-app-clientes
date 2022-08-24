import 'package:fic_clientes/app/page/login.dart';
import 'package:fic_clientes/app/util/responsive.dart';
import 'package:flutter/material.dart';
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
  String tipos_id = "";
  bool validation = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: LoginScreen(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/icon/logo_fic.png",
      backgroundColor: Colors.white,
    );
  }
}
