import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mainapp/main_screen.dart';
import 'package:mainapp/map_screen.dart';
import 'package:mainapp/setting.dart';
import 'package:mainapp/userpost.dart';
import 'package:mainapp/write_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

//いっちゃんひだり
final jmaurl = Uri.parse('https://www.jma.go.jp/jma/index.html');
final mapurl = Uri.parse('https://www.google.com/maps');
final jrurl = Uri.parse('https://www.westjr.co.jp/');
final localgovernmenturl =
    Uri.parse('https://www.city.higashihiroshima.lg.jp/index.html');
final frequrl = Uri.parse('https://fast.com/ja/');

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
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          //8080はhot.ssnetwork.io:44991 8000はhot.ssnetwork.io:44991
          ..loadRequest(Uri.parse("hot.ssnetwork.io:44991")),
      ),
      appBar: AppBar(
        title: const Text('SHISAKU'),
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
              icon: const Icon(Icons.place),
              onPressed: () {
                //　下のボタン２号クン
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
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
      endDrawer: Drawer(
        // ハンバーガーコンテンツ(とても効率的である既存の資材の流用)
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(172, 14, 196, 120),
              ),
              child: Text('3Dモデルの表示オブジェクトの切り替え(未実装)'),
            ),
            ListTile(
              title: const Text('雨切替'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('火山切替'),
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
//android error
//ERR_CLEARTEXT_NOT_PERMITTED
//Webpage not available
