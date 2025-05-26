import 'dart:convert';

import '/core/app_export.dart';

class Broadcast {
  num key;
  String function;
  Type? controller;

  Broadcast({this.key = 0, this.function = '', this.controller});

  factory Broadcast.fromJson(Map<String, dynamic> json) {
    return Broadcast(
      key: json['key'] is num
          ? json['key']
          : num.tryParse(json['key'].toString()) ?? 0,
      function: json['function'] ?? '',
      controller: json['controller'],
    );
  }

  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};
    void addField(String key, dynamic value) {
      if (!skip.contains(key) && value != null) dataMap[key] = value;
    }

    addField('key', key);
    addField('function', function);
    addField('controller', controller.toString());

    return dataMap;
  }
}

class BroadcasterController extends GetxController {
  Rx<List<Broadcast>> broadcast = Rx([]);

  @override
  void onInit() {
    super.onInit();

    ever(broadcast, (collection) {
      for (var broadcast in collection) {
        console.log(broadcast.toJson());
      }
    });
  }

  void emits(List<Broadcast> data) {
    broadcast.value = data;
  }

  void onBroadcast(String data) {
    List<dynamic> decodedJson = jsonDecode(data);
    List<Broadcast> collection = decodedJson
        .map((e) => Broadcast.fromJson(e as Map<String, dynamic>))
        .toList();

    broadcast.value = collection;
  }
}
