// ignore_for_file: camel_case_types

import 'dart:convert';
//まんなか
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class resModel {
  final String main;
  final String description;
  final String icon;

  resModel({required this.main, required this.description, required this.icon});

  factory resModel.fromJson(Map<String, dynamic> json) {
    var weather = json['weather'];
    var data = weather[0];

    var model = resModel(
        main: data['main'],
        description: data['description'],
        icon: data['icon']);

    return model;
  }
}

Future<resModel?> get() async {
  //8000番でlistenもpostもする。
  const domain = 'cool.ssnetwork.io:41700';
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

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: get(),
        builder: (BuildContext context, AsyncSnapshot<resModel?> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;

            return Scaffold(
                body: Center(
                    //つもり教育
                    child:
                        Text('現在の最新の情報は${data?.description}がこの近くで投稿されました。')));
          } else {
            return const Scaffold(body: Center(child: Text('処理中...')));
          }
        });
  }
}
