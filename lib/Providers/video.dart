import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Video with ChangeNotifier {
  SharedPreferences sp;
  int id;
  String title;
  String imgUrl;
  String youtbe;
  String soundcloud;
  String desc;
  int catid;
  bool isFavorite;

  Video(
      {this.id,
      this.title,
      this.imgUrl,
      this.youtbe,
      this.soundcloud,
      this.desc,
      this.catid,
      this.isFavorite = false});

  Future<void> toggleFavoriteStatus() async {
    isFavorite = !isFavorite;

    notifyListeners();
  }
}
