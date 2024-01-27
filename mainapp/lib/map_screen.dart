// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:mainapp/main_screen.dart';
import 'package:mainapp/map_screen_aleart.dart';
import 'package:mainapp/map_screen_weather.dart';
import 'package:mainapp/read3d_screen.dart';
import 'package:mainapp/setting.dart';
import 'package:mainapp/userpost.dart';
import 'package:mainapp/write_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

final jmaurl = Uri.parse('https://www.jma.go.jp/jma/index.html');
final mapurl = Uri.parse('https://www.google.com/maps');
final jrurl = Uri.parse('https://www.westjr.co.jp/');
final localgovernmenturl = Uri.parse('https://www.city.hiroshima.lg.jp/');
final frequrl = Uri.parse('https://fast.com/ja/');

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(
              "https://www.google.com/maps/d/u/0/viewer?mid=1mnkFMKBfDrceeiqA7zdvavfDUJg&hl=ja")),
      ),
      appBar: AppBar(
        title: const Text('clocky'),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 14, 196, 120),
              ),
              child: Text('開発中'),
            ),
            ListTile(
              title: const Text('ユーザーのポスト'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const user_view()),
                ); // ちなみにjrwest
              },
            ),
            ListTile(
              title: const Text('気象庁'),
              onTap: () {
                launchUrl(jmaurl); // メニューを閉じる
              },
            ),
            ListTile(
              title: const Text('自治体の発表'),
              onTap: () {
                launchUrl(localgovernmenturl); //東広島市
              },
            ),
            ListTile(
              title: const Text('通信環境'),
              onTap: () {
                launchUrl(frequrl); // 通信速度
              },
            ),
            ListTile(
              title: const Text('閉じる'),
              onTap: () {
                Navigator.pop(context); // メニューを閉じる
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        // ハンバーガーメニューのコンテンツ
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 14, 196, 120),
              ),
              child: Text('alpha_0.0.1'),
            ),
            ListTile(
              title: const Text('最初のページ'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                ); // メニューを閉じる
              },
            ),
            ListTile(
              title: const Text('雨雲レーダー'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MapPage_weather()),
                );
              },
            ),
            ListTile(
              title: const Text('警報・注意報'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MapPage_alert()),
                );
              },
            ),
            ListTile(
              title: const Text('通信環境'),
              onTap: () {
                launchUrl("https://fast.com" as Uri); // 通信速度
              },
            ),
            ListTile(
              title: const Text('閉じる'),
              onTap: () {
                Navigator.pop(context); // メニューを閉じる
              },
            ),
          ],
        ),
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
              icon: const Icon(Icons.edit),
              onPressed: () {
                //　下のボタン２号クン
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const writeingPage()),
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
  }
}
