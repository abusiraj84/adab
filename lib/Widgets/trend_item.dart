import 'package:division/division.dart';
import 'package:flutter/material.dart';

class TrendItem extends StatelessWidget {
  final int id;
  final String title;
  final String imgUrl;
  final String youtbe;
  final String soundcloud;
  final String desc;
  final int catid;
  TrendItem(
      {this.id,
      this.title,
      this.imgUrl,
      this.youtbe,
      this.soundcloud,
      this.desc,
      this.catid});

  @override
  Widget build(BuildContext context) {
    // final myColors = Provider.of<MyColors>(context);

    return Parent(
      style: ParentStyle()
        ..height(160)
        ..width(180)
        ..borderRadius(all: 25)
        ..margin(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Parent(
            style: ParentStyle()
              ..height(150)
              ..background.image(url: imgUrl, fit: BoxFit.cover)
              ..borderRadius(all: 22)
              ..elevation(1),
            child: Parent(
              style: ParentStyle()
                ..linearGradient(colors: [
                  Colors.blue.shade900.withOpacity(0.7),
                  Colors.red.shade800.withOpacity(0.4)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                ..borderRadius(all: 25),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Text(
                      '4.5',
                      style: TextStyle(color: Colors.yellow.shade700),
                    ),
                    Icon(Icons.star, color: Colors.yellow.shade700),
                  ],
                ),
              ),
            ),
          ),
          Txt(
            catid.toString(),
            style: TxtStyle()
              ..margin(right: 10, top: 10)
              ..fontSize(10)
              ..textColor(Colors.grey),
          ),
          Txt(title,
              style: TxtStyle()
                ..margin(right: 10, top: 10)
                ..fontSize(11))
        ],
      ),
    );
  }
}
