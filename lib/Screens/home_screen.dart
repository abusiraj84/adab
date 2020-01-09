import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bar_screen.dart';
import 'story_screen.dart';
import 'trending_video.dart';
import 'videos_cat_list.dart';
//https://dribbble.com/shots/7000412-Social-App-concept-FeedUP/attachments

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColors = Provider.of<MyColors>(context);

    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      // backgroundColor:myColors.grey ,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //appbar
            AppBarScreen(),

            //Story
            Container(height: 100, child: StoryScreen()),

            //Trending Videos
            TrendingVideos(),

            VideosCatLsit(),
          ],
        ),
      ),
    );
  }
}
