import 'package:fic_clientes/app/page/login.dart';
import 'package:flutter/material.dart';

Widget Logout(BuildContext context){
  return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      content: const Text('¿Estás seguro que deseas salir de la aplicación?', textAlign: TextAlign.start,),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const Text('Cancelar', style: TextStyle(color: Color(0XFF3880FF)),)
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => LoginScreen(),
                  ));
            },
            child: const Text('Salir', style: TextStyle(color: Color(0XFF3880FF)),)
        ),
      ]
  );
}