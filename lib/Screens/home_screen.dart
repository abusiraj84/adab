
import 'package:flutter/material.dart';

import 'app_bar_screen.dart';
import 'story_screen.dart';
import 'trending_video.dart';
import 'videos_cat_list.dart';
//https://dribbble.com/shots/7000412-Social-App-concept-FeedUP/attachments

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //appbar
                  AppBarScreen(),

                  //Story
                  Container(height: 100, child: StoryScreen()),

                  //Trending Videos
                  TrendingVideos(),

                  Container(height: MediaQuery.of(context).size.height*.5, child: VideosCatLsit()),

                  //nav

                  
                ],
              ),
      ),

    );
  }
}
