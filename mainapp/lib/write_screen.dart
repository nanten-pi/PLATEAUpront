// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print
//ペン
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mainapp/main_screen.dart';
import 'package:mainapp/map_screen.dart';
import 'package:mainapp/read3d_screen.dart';
import 'package:mainapp/setting.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // 位置情報サービスが有効かどうかをテストします。
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // 位置情報サービスが有効でない場合、続行できません。
    // 位置情報にアクセスし、ユーザーに対して
    // 位置情報サービスを有効にするようアプリに要請する。
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // ユーザーに位置情報を許可してもらうよう促す
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // 拒否された場合エラーを返す
      return Future.error('Location permissions are denied');
    }
  }

  // 永久に拒否されている場合のエラーを返す
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // ここまでたどり着くと、位置情報に対しての権限が許可されているということなので
  // デバイスの位置情報を返す。
  final position = await Geolocator.getCurrentPosition();
  final placeMarks = await geoCoding.placemarkFromCoordinates(
      position.latitude, position.longitude);
  final placeMark = placeMarks[0];
  print(placeMark.country); // 国が取得できます
  print(placeMark.administrativeArea); // 県が取得できます(日本の場合)
  print(placeMark.locality); // 市が取得できます(日本の場合)
  return await Geolocator.getCurrentPosition();
}

//GPSのデータのふり
int intRand = Random().nextInt(1);
//先に変数だけ宣言できねえのか???　よくわからん
String titles = 'hello world';
String naiyou = 'hello world';
final jmaurl = Uri.parse('https://www.jma.go.jp/jma/index.html');
final mapurl = Uri.parse('https://www.google.com/maps');
final jrurl = Uri.parse('https://www.westjr.co.jp/');
final localgovernmenturl = Uri.parse('https://www.city.hiroshima.lg.jp/');
final frequrl = Uri.parse('https://fast.com/ja/');

class writeingPage extends StatelessWidget {
  const writeingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('clocky'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const settingPage()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //deployed_code
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
            ),
            //閲覧（json)
            IconButton(
              icon: const Icon(Icons.view_in_ar),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const web3DviewPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.place),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(children: [
          TextField(
            decoration: InputDecoration(hintText: 'タイトル'),
            autofocus: false,
            onChanged: (text) {
              titles = text;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: '内容'),
            autofocus: false,
            onChanged: (text) {
              naiyou = text;
            },
          ),
          OutlinedButton(
            onPressed: () async {
              print(titles); //debug print
              print(naiyou);
              // 位置情報を取得する
              final position = await _determinePosition();
              print(position); //debug print
              // headersの作成
              final headers = {
                'Content-type': 'application/json; charset=UTF-8'
              };

              // bodyの作成
              final body = {
                //何かデータ入れ込めるかもね
                "current": {
                  // 'weather'のデータを格納する
                  "main": [
                    {
                      "id": 803,
                      "titles": "hello",
                      "payload": "see you",
                      "gps": "1"
                    }
                  ]
                }
              };
              body['titles'] = titles as Map<String, List<Map<String, Object>>>;
              body['payload'] =
                  naiyou as Map<String, List<Map<String, Object>>>;
              // urlの作成
              final url = Uri.https("http://localhost:8000/", "/post");

              // POSTリクエストの作成
              final response = await http.post(url,
                  headers: headers, body: jsonEncode(body));
            },
            child: Text('送信'),
          )
        ]),
      ),
    );
  }
}
