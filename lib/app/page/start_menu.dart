import 'package:fic_clientes/app/page/participants/participantsPage.dart';
import 'package:fic_clientes/app/page/home/homePage.dart';
import 'package:fic_clientes/app/page/movements/movementsPage.dart';
import 'package:fic_clientes/app/widgets/widget.dart';
import 'package:flutter/material.dart';

class StartMenuScreen extends StatefulWidget {
  StartMenuScreen({Key? key}) : super(key: key);

  @override
  State<StartMenuScreen> createState() => _StartMenuScreenState();
}

class _StartMenuScreenState extends State<StartMenuScreen> {
  int index = 0;
  final List<Widget> _widgets = [
    HomePageScreen(),
    MovementsPageScreen(),
    ParticipantsPageScreen()
  ];

  tapped(int tappedIndex) {
    setState(() {
      index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
              index == 0
                  ? "Inicio"
                  : index == 1
                      ? "Movimientos"
                      : "Participantes",
              style: const TextStyle(color: Color(0XFF12121D))),
          centerTitle: true,
          elevation: 1,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Logout(context);
                      });
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Color(0XFF4D4D4D),
                ))
          ],
        ),
        body: _widgets[index],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Color(0XFFB49948)),
          selectedItemColor: const Color(0XFFB49948),
          unselectedIconTheme: const IconThemeData(color: Color(0XFF18191B)),
          unselectedItemColor: const Color(0XFF18191B),
          currentIndex: index,
          onTap: tapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.payments), label: 'Movimientos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_activity), label: 'Participantes'),
          ],
        ));
  }
}
