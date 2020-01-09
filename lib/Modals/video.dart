//تحويل الجيسون لكلاس here https://app.quicktype.io/

import 'dart:convert';

import 'package:flutter/foundation.dart';

class Video with ChangeNotifier {
  String id;
  String title;
  String body;
  String imgUrl;
  String catname;

  Video({
    this.id ='0',
    this.title,
    this.body,
    this.imgUrl,
    this.catname
  });
  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        imgUrl: json["imgUrl"],
        catname: json["catname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "imgUrl": imgUrl,
        "catname": catname,
      };

//////////////////////////////// هنا يجب عليك تغيير المتغيرات حسب الكلاس الجديد
  @override
  String toString() {
    return 'Profile{id: $id, title: $title, body: $body, imgUrl: $imgUrl, catname: $catname}';
  }
}

List<Video> videoFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Video>.from(data.map((item) => Video.fromJson(item)));
}



String profileToJson(Video data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
