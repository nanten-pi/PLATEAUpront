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
          const MyHomePage(),
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
          //main.dartのviewModelProviderを読み込んでいる　仮説であるがクラス間の設定を同期してる?
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

// ktkrwktkこれあれっす、ヘッダフッターっす。
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clocky'),
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
              icon: Icon(Icons.map),
              onPressed: () {
                // 下のボタン１号クン
              },
            ),
            IconButton(
              icon: Icon(Icons.article),
              onPressed: () {
                //　下のボタン２号クン
              },
            ),
            IconButton(
              icon: Icon(Icons.layers),
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
