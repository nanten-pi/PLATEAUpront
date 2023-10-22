import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mainapp/read2d_screen.dart';
import 'package:mainapp/write_screen.dart';
import 'package:mainapp/main_screen.dart';

final jmaurl = Uri.parse('https://www.jma.go.jp/jma/index.html');
final mapurl = Uri.parse('https://www.google.com/maps');
final jrurl = Uri.parse('https://www.westjr.co.jp/');
final localgovernmenturl =
    Uri.parse('https://www.city.higashihiroshima.lg.jp/index.html');

//これはもしかしたらWindowsサ終案件かもしれん　対応が公式サイトによるとAndroidとiOSとwebだけだから
//3dモデルを表示する画面
// ignore: camel_case_types
class web3DviewPage extends StatefulWidget {
  const web3DviewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<web3DviewPage> {
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clocky'),
      ),
      drawer: Drawer(
        // ハンバーガーコンテンツ(とても効率的である既存の資材の流用)
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 14, 196, 120),
              ),
              child: Text('Clocky あくまで試験です'),
            ),
            ListTile(
              title: const Text('気象情報'),
              onTap: () {
                // メニュー1のアクションを追加
                launchUrl(jmaurl); // メニューを閉じる
              },
            ),
            ListTile(
              title: const Text('公共交通機関の情報'),
              onTap: () {
                // メニュー2のアクションを追加
                launchUrl(jrurl); // ちなみにjrwest
              },
            ),
            ListTile(
              title: const Text('自治体の発表'),
              onTap: () {
                // メニュー3のアクションを追加
                launchUrl(localgovernmenturl); //東広島市
              },
            ),
            ListTile(
              title: const Text('地図'),
              onTap: () {
                // メニュー4のアクションを追加
                launchUrl(mapurl); // googlemap
              },
            ),
            ListTile(
              title: const Text('通信環境'),
              onTap: () {
                // メニュー5のアクションを追加
                launchUrl(frequrl); // 通信速度
              },
            ),
            ListTile(
              title: const Text('閉じる'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      //コ↑コ↓からパクリ
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
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(172, 14, 196, 120),
              ),
              child: Text('マップの表示オブジェクトの切り替え'),
            ),
            ListTile(
              title: const Text('雨雲表示切替'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('電波表示切替'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('地震表示切替'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('閉じる'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
//コード整形便利すぎる
//android error
//ERR_CLEARTEXT_NOT_PERMITTED
//Webpage not available
