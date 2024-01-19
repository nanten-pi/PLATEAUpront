import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mainapp/read2d_screen.dart';
import 'package:mainapp/read3d_screen.dart';
import 'package:mainapp/setting.dart';
import 'package:mainapp/write_screen.dart';

//url_launcher
import 'package:url_launcher/url_launcher.dart';

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
  final dio = Dio();
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
      drawer: Drawer(
        // ハンバーガーメニューのコンテンツ
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 14, 196, 120),
              ),
              child: Text('試験です'),
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
                // メニュー5のアクションを追加
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
            //ここは画面遷移を実装して対処する（本体の実装画面とソースコードのツリーがかぶるから)
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                // 下のボタン１号クン
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const web3DviewPage()),
                );
              },
            ),
            //閲覧（json)
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
      body: Column(
        children: [
          Consumer(
            //ボタンを定義
            builder: (context, ref, builder) => ElevatedButton(
              //押された検知
              onPressed: () {},
              //ボタンの中身（ウィジェット)
              child: const Text("get data(現在使用不可)"),
            ),
          ),
          //ここでExampleAppクラスを呼び出している
          //const ExampleApp(),
        ],
      ),
    );
  }
}

//ここでExampleAppクラスを定義している
/*
class ExampleApp extends ConsumerWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Consumer(
        builder: (
          BuildContext context,
          ref,
          builder,
        ) {
          //viewmodel.dartのviewModelProviderを読み込んでいる　仮説であるがクラス間の設定を同期してる?
          final viewModel = ref.watch(viewModelProvider);
          return viewModel.when(
            data: (data) {
              return Center(
                //受け取ったデータを表示している
                child: Text(
                  data.message,
                  style: const TextStyle(fontSize: 30),
                ),
              );
            },
            //ロード中
            loading: () => const Center(
              //ぐるぐるマーク
              child: CircularProgressIndicator(),
            ),
            //エラー
            error: (error, stack) => const Center(
              child: Text("oops"),
            ),
          );
        },
      ),
    );
  }
}
*/
//予備役

