import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mainapp/map_screen.dart';
import 'package:mainapp/read3d_screen.dart';
import 'package:mainapp/setting.dart';
import 'package:mainapp/userpost.dart';
import 'package:mainapp/write_screen.dart';

//url_launcher
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

//できればこのurlもjsonで変えれるようにしたい
final jmaurl = Uri.parse('https://www.jma.go.jp/jma/index.html');
final mapurl = Uri.parse('https://www.google.com/maps');
final jrurl = Uri.parse('https://www.westjr.co.jp/');
final localgovernmenturl = Uri.parse('https://www.city.hiroshima.lg.jp/');
final frequrl = Uri.parse('https://fast.com/ja/');

//main.dartによって呼ばれるMainScreenクラス
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

//MainScreenを継承している
class _MainScreenState extends State<MainScreen> {
  final controller = WebViewController();

  @override
  void initState() {
    super.initState();
    Future(() async {
      final html = await rootBundle.loadString('assets/twitter.html');
      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(
          Uri.dataFromString(
            html,
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8'),
          ),
        );
    });
  }

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
              icon: const Icon(Icons.place),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()),
                );
              },
            ),
            //閲覧（json)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const writeingPage()),
                );
              },
            ),
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
          ],
        ),
      ),
      body: Center(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
//予備役

