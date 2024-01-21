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

class writeingPage extends StatelessWidget {
  const writeingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHISAKU'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // ハンバーガーメニュー君な筈。できてるかは知らん
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const settingPage()),
              );
              // アクションとか追加できるじょー(多分)
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
                // 下のボタン１号クン
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
                //　下のボタン２号クン
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
                // 下のボタン３号クン
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
              final url = Uri.https("http://cool.ssnetwork.io:41700", "/post");

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
