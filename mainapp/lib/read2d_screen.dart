import 'dart:convert';
//まんなか
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class WeatherModel {
  final String main;
  final String description;
  final String icon;

  WeatherModel(
      {required this.main, required this.description, required this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var weather = json['weather'];
    var data = weather[0];

    var model = WeatherModel(
        main: data['main'],
        description: data['description'],
        icon: data['icon']);

    return model;
  }
}

Future<WeatherModel?> get() async {
  const lat = '35.65138';
  const lon = '139.63670';
  const key = 'aa50ce0598c22de20f75cf3ea31ac312';

  const domain = 'https://api.openweathermap.org';
  const pass = '/data/2.5/onecall';
  const query = '?lat=$lat&lon=$lon&exclude=daily&lang=ja&appid=$key';

  var url = Uri.parse(domain + pass + query);
  debugPrint('url: $url');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var body = response.body;
    var decodeData = jsonDecode(body);
    var json = decodeData['current'];
    var model = WeatherModel.fromJson(json);

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
        builder: (BuildContext context, AsyncSnapshot<WeatherModel?> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;

            return Scaffold(
                body: Center(child: Text('現在の天気は${data?.description}です！')));
          } else {
            return const Scaffold(body: Center(child: Text('処理中...')));
          }
        });
  }
}
