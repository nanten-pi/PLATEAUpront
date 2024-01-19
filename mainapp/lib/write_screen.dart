// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables
//ペン
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:mainapp/read2d_screen.dart';
import 'package:mainapp/read3d_screen.dart';
import 'package:mainapp/setting.dart';
import 'package:mainapp/write_screen.dart';

//GPSのデータのふり
int intRand = Random().nextInt(1);
//先に変数だけ宣言できねえのか???　よくわからん
String titles = 'hello world';
String naiyou = 'helllo world';

class writeingPage extends StatelessWidget {
  const writeingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿ページ'),
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
              print(titles);
              print(naiyou);
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                // 下のボタン１号クン(見た目のみの無意味なボタン)
              },
            ),
            IconButton(
              icon: const Icon(Icons.article),
              onPressed: () {
                //　下のボタン２号クン
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.layers),
              onPressed: () {
                // 下のボタン３号クン
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const writeingPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
