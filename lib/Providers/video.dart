import 'package:flutter/material.dart';

class Video with ChangeNotifier{
  int id;
  String title;
  String imgUrl;
  String youtbe;
  String soundcloud;
  String desc;
  int catid;
  bool isFavorite;
  
  Video({this.id,this.title,this.imgUrl,this.youtbe,this.soundcloud,this.desc,this.catid,this.isFavorite= false});

void toggleFavoriteStatus(){
  isFavorite = !isFavorite;
  notifyListeners();
}

}