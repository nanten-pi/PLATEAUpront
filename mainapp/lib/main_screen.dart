import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'うんちごみしね',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('うんちごみしね'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu), // ハンバーガーメニュー君な筈。できてるかは知らん
            onPressed: () {
              // アクションとか追加できるじょー(多分)
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          '表示場所。内容は無いようです。',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.button1),
              onPressed: () {
                // 下のボタン１号クン
              },
            ),
            IconButton(
              icon: Icon(Icons.button2),
              onPressed: () {
                //　下のボタン２号クン
              },
            ),
            IconButton(
              icon: Icon(Icons.button3),
              onPressed: () {
                // 下のボタン３号クン
              },
            ),
          ],
        ),
      ),
    );
  }
}
