import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final myColors = Provider.of<MyColors>(context);

    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      // backgroundColor:myColors.grey ,
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('الرئيسية'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
 
    );
  }
}
