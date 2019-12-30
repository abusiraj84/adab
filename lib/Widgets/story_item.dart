import 'dart:math';

import 'package:adab/Providers/colors.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryItem extends StatelessWidget {
  final int id;
  final String title;
  final String imgUrl;
  final String youtbe;
  final String soundcloud;
  final String desc;
  StoryItem(
      {this.id,
      this.title,
      this.imgUrl,
      this.youtbe,
      this.soundcloud,
      this.desc});

  @override
  Widget build(BuildContext context) {
    final myColors = Provider.of<MyColors>(context);

    return Parent(
      style: ParentStyle()
        ..height(140)
        ..width(120)
        ..borderRadius(all: 25)
        ..border(
          all: 3.5,
          color: myColors.multiColors[Random().nextInt(4)],
        )
        ..elevation(1)
        ..margin(left: 10, bottom: 5),
      child: Parent(
          style: ParentStyle()
            ..background.image(url: imgUrl, fit: BoxFit.cover)
            ..border(all: 2, color: Colors.white)
            ..borderRadius(all: 22)),
    );
  }
}
