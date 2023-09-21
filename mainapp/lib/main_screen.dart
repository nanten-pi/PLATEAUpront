import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainapp/viewmodel.dart';

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
        title: const Text('Clocky'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // ハンバーガーメニュー君な筈。できてるかは知らん
            onPressed: () {
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
                color: Colors.blue,
              ),
              child: Text('Clocky あくまで試験です'),
            ),
            ListTile(
              title: const Text('気象情報'),
              onTap: () {
                // メニュー1のアクションを追加
                Navigator.pop(context); // メニューを閉じる
              },
            ),
            ListTile(
              title: const Text('公共交通機関の情報'),
              onTap: () {
                // メニュー2のアクションを追加
                Navigator.pop(context); // メニューを閉じる
              },
            ),
            ListTile(
              title: const Text('自治体からのお知らせ'),
              onTap: () {
                // メニュー3のアクションを追加
                Navigator.pop(context); // メニューを閉じる
              },
            ),
            ListTile(
              title: const Text('地図'),
              onTap: () {
                // メニュー4のアクションを追加
                Navigator.pop(context); // メニューを閉じる
              },
            ),
            ListTile(
              title: const Text('通信環境'),
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
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                // 下のボタン１号クン
              },
            ),
            IconButton(
              icon: const Icon(Icons.article),
              onPressed: () {
                //　下のボタン２号クン
              },
            ),
            IconButton(
              icon: const Icon(Icons.layers),
              onPressed: () {
                // 下のボタン３号クン
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
              onPressed: () {
                final viewModel = ref.read(viewModelProvider.notifier);
                //viewmodel.dartのretrieveMessageを呼び出している
                viewModel.retrieveMessage();
              },
              //ボタンの中身（ウィジェット)
              child: const Text("get data"),
            ),
          ),
          //ここでExampleAppクラスを呼び出している
          const ExampleApp(),
        ],
      ),
    );
  }
}

//ここでExampleAppクラスを定義している
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

//予備役
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter サンプル UI'),
      ),
      drawer: Drawer(
        // ハンバーガーメニューのコンテンツ
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('メニュー'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('メニュー1'),
              onTap: () {
                // メニュー1のアクションを追加
                Navigator.pop(context); // メニューを閉じる
              },
            ),
            ListTile(
              title: const Text('メニュー2'),
              onTap: () {
                // メニュー2のアクションを追加
                Navigator.pop(context); // メニューを閉じる
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          '中央の空白のUI',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '検索',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        // フッターナビゲーションのアクションハンドラを追加
        onTap: (int index) {
          if (index == 0) {
            // ホームをタップした場合のアクション
          } else if (index == 1) {
            // 検索をタップした場合のアクション
          } else if (index == 2) {
            // 設定をタップした場合のアクション
          }
        },
      ),
    );
  }
}
