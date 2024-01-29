// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables
//ペン
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainapp/main_screen.dart';
import 'package:mainapp/map_screen.dart';
import 'package:mainapp/read3d_screen.dart';
import 'package:mainapp/setting.dart';

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
              //print(titles); debug print
              //print(naiyou);
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
