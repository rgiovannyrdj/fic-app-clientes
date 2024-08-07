import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fic_clientes/app/page/start_menu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  final Duration connectTimeout = const Duration(seconds: 100);
  final Duration receiveTimeout = const Duration(seconds: 100);
  Dio dio = Dio();
  String url = "https://cervantino.2link.com.mx";

  @override
  Future loginFic(BuildContext context, scaffoldKey, String nameCard,
      String pinCard) async {
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;
    final prefs = await SharedPreferences.getInstance();
    final data = {"numero": nameCard, "nip": pinCard};
    try {
      final response = await dio.post(
        '$url/cervantino/rest/serviciosFIC/consultaSaldo/byCard',
        options: Options(contentType: 'application/json', headers: {
          "j_username": 'mision_fic',
          "j_password": '12345678',
        }),
        data: data,
      );
      if (response.statusCode == 200) {
        if (response.data['exitoso'] == true) {
          prefs.setString('numCardFic', nameCard);
          try {
            final response = await dio.post(
              '$url/cervantino/rest/serviciosFIC/consultaSaldo/byTarjeta?numeroTarjeta=$nameCard',
              options: Options(contentType: 'application/json', headers: {
                "j_username": 'mision_fic',
                "j_password": '12345678',
              }),
            );
            if (response.statusCode == 200) {
              if (response.data['exitoso'] == true) {
                prefs.setString('idTransactionFic',
                    response.data['datos']['id'].toString());
                prefs.setString(
                    'saldoFic', response.data['datos']['saldo'].toString());
                prefs.setString('dateFic',
                    response.data['datos']['fechaFinVigencia'].toString());
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => StartMenuScreen(),
                    ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(response.data['mensaje']
                        .toString()
                        .replaceAll('BusinessException: ', '')),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            }
          } catch (err) {
            print(err);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data['mensaje']
                  .toString()
                  .replaceAll('BusinessException: ', '')),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Future<List?> homeFic(BuildContext context, scaffoldKey) async {
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;
    String? numCardFic;
    final prefs = await SharedPreferences.getInstance();
    numCardFic = prefs.getString('numCardFic') ?? '';
    try {
      final response = await dio.post(
        '$url/cervantino/rest/serviciosFIC/consultaSaldo/byTarjeta?numeroTarjeta=$numCardFic',
        options: Options(contentType: 'application/json', headers: {
          "j_username": 'mision_fic',
          "j_password": '12345678',
        }),
      );
      if (response.statusCode == 200) {
        if (response.data['exitoso'] == true) {
          prefs.setString(
              'idTransactionFic', response.data['datos']['id'].toString());
          prefs.setString(
              'saldoFic', response.data['datos']['saldo'].toString());
          prefs.setString(
              'dateFic', response.data['datos']['fechaFinVigencia'].toString());
          final data = [response.data['datos']];
          return data;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data['mensaje']
                  .toString()
                  .replaceAll('BusinessException: ', '')),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );

          return [];
        }
      }
    } catch (err) {
      return [];
    }
  }

  @override
  Future<Uint8List?> homeImageFic(BuildContext context, scaffoldKey) async {
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;
    try {
      final response = await dio.post(
        '$url/cervantino/rest/serviciosFIC/config-app',
        options: Options(contentType: 'application/json', headers: {
          "j_username": 'mision_fic',
          "j_password": '12345678',
        }),
      );
      if (response.statusCode == 200) {
        if (response.data['exitoso'] == true) {
          String bytes = response.data['datos'][0]['image'];
          Uint8List image = base64Decode(bytes);
          return image;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data['mensaje']
                  .toString()
                  .replaceAll('BusinessException: ', '')),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Future<List?> TransactionFic(
      BuildContext context, scaffoldKey, int page) async {
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;
    String? idTransactionFic;
    final prefs = await SharedPreferences.getInstance();
    idTransactionFic = prefs.getString('idTransactionFic') ?? '';
    final data = {"page": page, "size": 8};
    try {
      final response = await dio.post(
        '$url/cervantino/rest/serviciosFIC/transacciones/$idTransactionFic/cuenta/page',
        options: Options(contentType: 'application/json', headers: {
          "j_username": 'mision_fic',
          "j_password": '12345678',
        }),
        data: data,
      );
      if (response.statusCode == 200) {
        if (response.data['exitoso'] == true) {
          List data = response.data['datos']['result'];
          return data;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data['mensaje']
                  .toString()
                  .replaceAll('BusinessException: ', '')),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
          return [];
        }
      }
    } catch (err) {
      return [];
    }
  }

  @override
  Future<List?> ParticipantsFic(BuildContext context, scaffoldKey) async {
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;
    try {
      final response = await dio.post(
        '$url/cervantino/rest/serviciosFIC/negocios',
        options: Options(contentType: 'application/json', headers: {
          "j_username": 'mision_fic',
          "j_password": '12345678',
        }),
      );
      if (response.statusCode == 200) {
        if (response.data['exitoso'] == true) {
          List data = response.data['datos'];
          return data;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data['mensaje']
                  .toString()
                  .replaceAll('BusinessException: ', '')),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
          return [];
        }
      }
    } catch (err) {
      return [];
    }
  }
}
