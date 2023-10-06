import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

//3dモデルを表示する画面
class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clocky3dViewer'),
        ),
        body: const ModelViewer(
          //webにないものでもおｋっぽい
          src: 'https://modelviewer.dev/shared-assets/models/NeilArmstrong.glb',
          autoRotate: true,
          cameraControls: true,
        ));
  }
}
//コード整形便利すぎる
