import 'package:achievement_view/achievement_view.dart';
import 'package:adab/Providers/api_service.dart';
import 'package:adab/Providers/videos.dart';
import 'package:adab/Screens/app_bar_back_screen.dart';
import 'package:adab/db/favorite_model.dart';
import 'package:adab/db/helper_presenter.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(
      {Key key, this.id, this.title, this.imgUrl, this.catId, this.body})
      : super(key: key);

  final String catId;
  final String id;
  final String imgUrl;
  final String title;
  final String body;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> implements HomeContract {
  HomePresenter homePresenter;
  bool isItRecord = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePresenter = HomePresenter(this);
  }

  @override
  void screenUpdate() {}

  @override
  Widget build(BuildContext context) {
    Future insertVideo(
        BuildContext context, HomePresenter homePresenter, data) async {
      //Client client = Client();
      Favorites favorites = Favorites(
          int.parse(widget.id), widget.title, widget.imgUrl, widget.body);
      await homePresenter.db.insertMovie(favorites);
      homePresenter.updateScreen();
    }

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.imgUrl,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
        loop: true,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            AppBarBackScreen(),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              liveUIColor: Colors.yellow,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Parent(
                style: ParentStyle()
                  ..background.color(Colors.white)
                  ..borderRadius(topLeft: 60, topRight: 60)
                  ..padding(right: 20, left: 20, top: 40),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => share(context, widget.imgUrl,widget.title),
                            child: Parent(
                                style: ParentStyle()
                                  ..background.color(Colors.grey.shade300)
                                  ..padding(all: 10)
                                  ..circle(true),
                                child: Icon(Icons.share)),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Parent(
                            style: ParentStyle()
                              ..background.color(Colors.grey.shade300)
                              ..padding(all: 10)
                              ..circle(true),
                            child: FutureBuilder<bool>(
                                future: homePresenter
                                    .isItRecord(int.parse(widget.id)),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
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
                                                  textStyleTitle:
                                                      TextStyle(fontSize: 13),
                                                  textStyleSubTitle:
                                                      TextStyle(fontSize: 12),
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  duration:
                                                      Duration(seconds: 1),
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
                                              homePresenter
                                                  .delete(int.parse(widget.id));
                                              isItRecord = false;
                                              print('deleted from db success');
                                              AchievementView(context,
                                                  title:
                                                      "تم إزالة الفيديو من المفضلة",
                                                  subTitle: "تم الحدف صديق��",
                                                  //onTab: _onTabAchievement,
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                  ),
                                                  //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
                                                  //borderRadius: 5.0,
                                                  color: Colors.amber,
                                                  textStyleTitle:
                                                      TextStyle(fontSize: 13),
                                                  textStyleSubTitle:
                                                      TextStyle(fontSize: 12),
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  duration:
                                                      Duration(seconds: 1),
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Text(
                            widget.title,
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: double.infinity,
                          child: Text(
                            widget.body,
                            style: TextStyle(color: Colors.black87),
                            textAlign: TextAlign.justify,
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void share(BuildContext context, imgUrl, title) {
    final String text = "$title - https://www.youtube.com/watch?v=$imgUrl - يمكنك تحميل تطبيق الأدب الخالد من هنا http://google.com";
    Share.share(text, subject: imgUrl);
  }
}
