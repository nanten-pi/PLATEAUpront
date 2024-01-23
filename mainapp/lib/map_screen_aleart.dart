// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:mainapp/main_screen.dart';
import 'package:mainapp/read3d_screen.dart';
import 'package:mainapp/setting.dart';
import 'package:mainapp/write_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:mainapp/map_screen.dart';
import 'package:mainapp/map_screen_weather.dart';

/*
class resModel {
  final String titles; //titles
  final String payload; //payload
  final String gps; //gps_code

  resModel({required this.titles, required this.payload, required this.gps});

  factory resModel.fromJson(Map<String, dynamic> json) {
    var weather = json['main'];
    var data = weather[0];

    var model = resModel(
        titles: data['titles'], payload: data['payload'], gps: data['gps']);

    return model;
  }
}

Future<resModel?> get() async {
  //8000番でlistenもpostもする。
  const domain = 'http://cool.ssnetwork.io:41700';
  const pass = '/get';

  var url = Uri.parse(domain + pass);
  debugPrint('url: $url');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var body = response.body;
    var decodeData = jsonDecode(body);
    var json = decodeData['current'];
    var model = resModel.fromJson(json);

    return model;
  }
  return null;
}
*/
class MapPage_alert extends StatelessWidget {
  const MapPage_alert({super.key});
  @override
  Widget build(BuildContext context) {
    /*
    return FutureBuilder(
        future: get(),
        builder: (BuildContext context, AsyncSnapshot<resModel?> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
      */
    return Scaffold(
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(
              "https://www.jma.go.jp/bosai/map.html#5/34.398/133.44/&elem=all&contents=warning")),
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
