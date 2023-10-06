import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainapp/main_screen.dart';

//アプリの実行　すべての源
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

//多分こいつが大本のクラス
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clocky',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 15, 212, 110)),
        useMaterial3: true,
      ),
      //中身はmain_screen.dartのMainScreenクラス
      home: const MainScreen(),
    );
  }
}
