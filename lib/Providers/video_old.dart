// import 'package:flutter/material.dart';
// import 'dart:convert';

// class Video with ChangeNotifier {
//   int id;
//   String title;
//   String imgUrl;
//   String youtbe;
//   String body;
//   String catId;
//   bool isFavorite;

//   Video(
//       {this.id,
//       this.title,
//       this.imgUrl,
//       this.youtbe,
//       this.body,
//       this.catId,
//       this.isFavorite = false});

//       factory Video.fromJson(Map<String, dynamic> json) => Video(
//         id: json["id"],
//         title: json["title"],
//         imgUrl: json["imgUrl"],
//         body: json["body"],
//         catId: json["catId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "imgUrl": imgUrl,
//         "body": body,
//         "catId": catId,
//       };
//        @override
//   String toString() {
//     return 'Video{id: $id, title: $title, imgUrl: $imgUrl, body: $body, catId: $catId}';
//   }

// }

// List<Profile> videoFromJson(String jsonData) {
//   final data = json.decode(jsonData);
//   return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
// }



// String videoToJson(Profile data) {
//   final jsonData = data.toJson();
//   return json.encode(jsonData);
// }

