import 'package:achievement_view/achievement_view.dart';
import 'package:adab/db/favorite_model.dart';
import 'package:adab/db/helper_presenter.dart';

import '../Providers/video.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendItem extends StatefulWidget {
  final int id;
  final String title;
  final String imgUrl;

  TrendItem({this.id, this.title, this.imgUrl});

  @override
  _TrendItemState createState() => _TrendItemState();
}

class _TrendItemState extends State<TrendItem> implements HomeContract {
  HomePresenter homePresenter;
  bool isItRecord = false;

  @override
  void initState() {
    super.initState();
    homePresenter = HomePresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    final video = Provider.of<Video>(context, listen: false);

    Future insertVideo(
        BuildContext context, HomePresenter homePresenter, data) async {
      //Client client = Client();
      Favorites favorites = Favorites(
        widget.id,
        widget.title,
        widget.imgUrl,
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
                        FutureBuilder<bool>(
                            future: homePresenter.isItRecord(widget.id),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) print(snapshot.error);
                              var data = snapshot.data;

                              if (isItRecord != true) isItRecord = data;
                              // print('girdi');

                              return isItRecord == false
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          insertVideo(
                                              context, homePresenter, data);
                                          isItRecord = true;
                                          print('inserted to db success');
                                          AchievementView(context,
                                              title: "تمت إضافته للمفضلة",
                                              subTitle:
                                                  "يمكنك الرجوع إليها في قسم المفضلة",
                                              //onTab: _onTabAchievement,
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                              //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
                                              //borderRadius: 5.0,
                                              color: Colors.amber,
                                              textStyleTitle: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                              textStyleSubTitle:
                                                  TextStyle(fontSize: 12),
                                              alignment: Alignment.bottomCenter,
                                              duration: Duration(seconds: 1),
                                              //isCircle: false,
                                              listener: (status) {
                                            //print(status);
                                            //AchievementState.opening
                                            //AchievementState.open
                                            //AchievementState.closing
                                            //AchievementState.closed
                                          })
                                            ..show();
                                        });
                                      },
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          homePresenter.delete(widget.id);
                                          isItRecord = false;
                                          print('deleted from db success');
                                          AchievementView(context,
                                              title:
                                                  "تم إزالة الفيديو من المفضلة",
                                              subTitle: "",
                                              //onTab: _onTabAchievement,
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                              ),
                                              //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
                                              //borderRadius: 5.0,
                                              color: Colors.black,
                                              textStyleTitle:
                                                  TextStyle(fontSize: 13),
                                              textStyleSubTitle:
                                                  TextStyle(fontSize: 12),
                                              alignment: Alignment.bottomCenter,
                                              duration: Duration(seconds: 1),
                                              //isCircle: false,
                                              listener: (status) {
                                            // print(status);
                                            //AchievementState.opening
                                            //AchievementState.open
                                            //AchievementState.closing
                                            //AchievementState.closed
                                          })
                                            ..show();
                                        });
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    );
                            }),
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

  @override
  void screenUpdate() {}
}
