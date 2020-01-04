import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/video.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendItem extends StatefulWidget {
  bool isFavorite;
  int id;

  TrendItem({this.isFavorite, this.id});

  @override
  _TrendItemState createState() => _TrendItemState();
}

const String spKey = 'myBool';

class _TrendItemState extends State<TrendItem> {
  SharedPreferences sharedPreferences;
  bool _testValue;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      _testValue = sharedPreferences.getBool(widget.id.toString());
      // will be null if never previously saved

      if (_testValue == null) {
        _testValue = false;
        persist(_testValue); // set an initial value
      }

      setState(() {});
    });
  }

  void persist(bool value) {
    setState(() {
      _testValue = value;
    });
    sharedPreferences?.setBool(widget.id.toString(), value);
  }

  @override
  Widget build(BuildContext context) {
    final video = Provider.of<Video>(context, listen: false);

    return Parent(
      style: ParentStyle()
        ..height(160)
        ..width(180)
        ..borderRadius(all: 25)
        ..margin(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onDoubleTap: () {
              // video.toggleFavoriteStatus();
            },
            child: Parent(
              style: ParentStyle()
                ..height(150)
                ..background.image(
                    url:
                        'https://img.youtube.com/vi/${video.imgUrl}/maxresdefault.jpg',
                    fit: BoxFit.cover)
                ..borderRadius(all: 22)
                ..elevation(1)
                ..ripple(true),
              child: Parent(
                style: ParentStyle()
                  ..linearGradient(colors: [
                    Colors.blue.shade900.withOpacity(0.7),
                    Colors.red.shade800.withOpacity(0.4)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                  ..borderRadius(all: 25),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Consumer<Video>(
                    builder: (ctx, video, child) => Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          child: Icon(
                            _testValue != false
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red.shade600,
                            size: 20,
                          ),
                          onTap: () {
                            video.toggleFavoriteStatus();
                            _testValue = !_testValue;
                            widget.isFavorite = _testValue;
                            sharedPreferences.setBool(
                                widget.id.toString(), _testValue);
                            print(widget.isFavorite);
                          },
                        ),
                        Spacer(),
                        Text(
                          '200',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.remove_red_eye,
                          size: 20,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Txt(
            video.catid.toString(),
            style: TxtStyle()
              ..margin(right: 10, top: 10)
              ..fontSize(10)
              ..textColor(Colors.grey),
          ),
          Txt(video.title,
              style: TxtStyle()
                ..margin(right: 10, top: 10)
                ..fontSize(11))
        ],
      ),
    );
  }
}
