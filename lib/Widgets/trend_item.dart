import 'package:achievement_view/achievement_view.dart';
import 'package:adab/Modals/video.dart';
import 'package:adab/Providers/cat_tab_prov.dart';
import 'package:adab/db/favorite_model.dart';
import 'package:adab/db/helper_presenter.dart';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendItem extends StatefulWidget {
  final String id;
  final String title;
  final String imgUrl;
  final String body;
  final String catname;
  final int fav;
  TrendItem({this.id, this.title, this.imgUrl,this.body,this.catname,this.fav});

  @override
  _TrendItemState createState() => _TrendItemState();
}

class _TrendItemState extends State<TrendItem> implements HomeContract {
  HomePresenter homePresenter;
  bool isItRecord;

  @override
  void initState() {
    super.initState();
    homePresenter = HomePresenter(this);
    isItRecord = false;
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final video = Provider.of<Video>(context, listen: false);
    final tabsIndex = Provider.of<TabsIndex>(context);

    Future insertVideo(
        BuildContext context, HomePresenter homePresenter, data) async {
 
      Favorites favorites = Favorites(
        int.parse(widget.id),
        widget.title,
        widget.imgUrl,
        widget.body,
      );
      await homePresenter.db.insertMovie(favorites);
      homePresenter.updateScreen();
    }

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
                ..height(120)
                ..background.image(
                    url:
                        'https://img.youtube.com/vi/${widget.imgUrl}/maxresdefault.jpg',
                    fit: BoxFit.cover)
                ..borderRadius(all: 22)
                ..elevation(1)
               ,
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
                        FutureBuilder<bool>(
                            future: homePresenter.isItRecord(int.parse(widget.id)),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) print(snapshot.error);
                              var data = snapshot.data;

                              if (isItRecord != true) isItRecord = data;
                              // print('girdi');

                              return isItRecord == false
                                  ? Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  )
                                  : Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  );
                            }),
                        Spacer(),
                        // Text(
                        //   '200',
                        //   style: TextStyle(color: Colors.white70),
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        // Icon(
                        //   Icons.remove_red_eye,
                        //   size: 20,
                        //   color: Colors.white70,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Txt(
            widget.catname,
            style: TxtStyle()
              ..margin(right: 10, top: 10)
              ..fontSize(10)
              ..textColor(Colors.grey),
          ),
          Txt(widget.title,
              style: TxtStyle()
                ..margin(right: 10, top: 5)
                ..fontSize(13)..fontWeight(FontWeight.normal)
                )
        ],
      ),
    );
  }

  @override
  void screenUpdate() {}
}
