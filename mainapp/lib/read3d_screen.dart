import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

//これはもしかしたらWindowsサ終案件かもしれん　対応が公式サイトによるとAndroidとiOSとwebだけだから
//3dモデルを表示する画面
// ignore: camel_case_types
class web3DviewPage extends StatelessWidget {
  const web3DviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clocky3dVieweraaaaa'),
        ),
        body: const ModelViewer(
          //assetsでも可能
          src: 'https://modelviewer.dev/shared-assets/models/NeilArmstrong.glb',
          autoRotate: true,
          cameraControls: true,
        ));
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String result) {},
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Switch 1',
                  child: SwitchListTile(
                    title: const Text('Switch 1'),
                    value: switch1,
                    onChanged: (bool value) {
                      setState(() {
                        switch1 = value;
                      });
                    },
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Switch 2',
                  child: SwitchListTile(
                    title: const Text('Switch 2'),
                    value: switch2,
                    onChanged: (bool value) {
                      setState(() {
                        switch2 = value;
                      });
                    },
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Switch 3',
                  child: SwitchListTile(
                    title: const Text('Switch 3'),
                    value: switch3,
                    onChanged: (bool value) {
                      setState(() {
                        switch3 = value;
                      });
                    },
                  ),
                ),
              ],
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
