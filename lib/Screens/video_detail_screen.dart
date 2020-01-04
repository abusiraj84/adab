import 'package:adab/db/favorite_model.dart';
import 'package:adab/db/helper_presenter.dart';
import 'package:http/http.dart';

import '../Providers/videos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:achievement_view/achievement_view.dart';

import 'app_bar_detail.dart';

class VideoDetailScreen extends StatefulWidget {
  @override
  _VideoDetailScreenState createState() => _VideoDetailScreenState();
}

IconData myIcon;

class _VideoDetailScreenState extends State<VideoDetailScreen>
    implements HomeContract {
  HomePresenter homePresenter;
  bool isItRecord = false;

  @override
  void initState() {
    super.initState();
    homePresenter = HomePresenter(this);
  }

  @override
  void screenUpdate() {
  
  }

  @override
  Widget build(BuildContext context) {
    final audioid = ModalRoute.of(context).settings.arguments as int;
    final audiopost = Provider.of<Videos>(context)
        .list
        .firstWhere((aud) => aud.id == audioid);
    Future insertVideo(
        BuildContext context, HomePresenter homePresenter, data) async {
      //Client client = Client();
      Favorites favorites = Favorites(
        audiopost.id,
        audiopost.title,
        audiopost.imgUrl,
      );
      await homePresenter.db.insertMovie(favorites);
      homePresenter.updateScreen();

     
    }

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: audiopost.imgUrl,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppBarDetailScreen(),
            // Image.network(
            //   audiopost.imgUrl,
            //   fit: BoxFit.cover,
            //   height: 300,
            //   width: double.infinity,
            // ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              liveUIColor: Colors.yellow,
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<bool>(
                future: homePresenter.isItRecord(audiopost.id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  var data = snapshot.data;

                  if (isItRecord != true) isItRecord = data;
                  // print('girdi');

                  return isItRecord == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              insertVideo(context, homePresenter,data);
                              isItRecord = true;
                              print('inserted to db success');
                              AchievementView(context,
                                  title: "تمت إضافته للمفضلة",
                                  subTitle: "يمكنك الرجوع إليها في قسم المفضلة",
                                  //onTab: _onTabAchievement,
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
                                  //borderRadius: 5.0,
                                  color: Colors.amber,
                                  textStyleTitle: TextStyle(fontSize: 13),
                                  textStyleSubTitle: TextStyle(fontSize: 12),
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
                              homePresenter.delete(audiopost.id);
                              isItRecord = false;
                              print('deleted from db success');
                              AchievementView(context,
                                  title: "تم إزالة الفيديو من المفضلة",
                                  subTitle: "تم الحدف صديقي",
                                  //onTab: _onTabAchievement,
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
                                  //borderRadius: 5.0,
                                  color: Colors.amber,
                                  textStyleTitle: TextStyle(fontSize: 13),
                                  textStyleSubTitle: TextStyle(fontSize: 12),
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
                })
          ],
        ),
      ),
    );
  }
}
