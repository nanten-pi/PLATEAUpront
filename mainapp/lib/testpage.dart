// ignore_for_file: camel_case_types
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mainapp/main_screen.dart';
import 'package:mainapp/read3d_screen.dart';
import 'package:mainapp/write_screen.dart';
import 'package:http/http.dart' as http;

final jmaurl = Uri.parse('https://www.jma.go.jp/jma/index.html');
final mapurl = Uri.parse('https://www.google.com/maps');
final jrurl = Uri.parse('https://www.westjr.co.jp/');
final localgovernmenturl = Uri.parse('https://www.city.hiroshima.lg.jp/');
final frequrl = Uri.parse('https://fast.com/ja/');

class resModel {
  final String titles; //titles
  final String payload; //payload
  final String gps; //gps_code

  resModel({required this.titles, required this.payload, required this.gps});

  factory resModel.fromJson(Map<String, dynamic> json) {
    var weather = json['main'];
    var data = weather[0];

    var model = resModel(
        titles: data['titles'], payload: data['payload'], gps: data['gps']);

    return model;
  }
}

Future<resModel?> get() async {
  //8000番でlistenもpostもする。
  const domain = 'http://localhost:8000';
  const pass = '/get';

  var url = Uri.parse(domain + pass);
  debugPrint('url: $url');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var body = response.body;
    var decodeData = jsonDecode(body);
    var json = decodeData['current'];
    var model = resModel.fromJson(json);

    return model;
  }
  return null;
}

class user_view extends StatelessWidget {
  const user_view({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: get(),
        builder: (BuildContext context, AsyncSnapshot<resModel?> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('clocky'),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //deployed_code
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      // 下のボタン１号クン
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()),
                      );
                    },
                  ),
                  //閲覧（json)
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      //　下のボタン２号クン
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const writeingPage()),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.view_in_ar),
                    onPressed: () {
                      // 下のボタン３号クン
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const web3DviewPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
