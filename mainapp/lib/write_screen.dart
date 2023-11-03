// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables
//ペン
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//GPSのデータのふり
int intRand = Random().nextInt(101);
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
            onPressed: () {
              print(titles);
              print(naiyou);
            },
            child: Text('送信'),
          )
        ]),
      ),
    );
  }
}
