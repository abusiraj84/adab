
import 'dart:math';

import 'package:adab/Modals/video.dart';
import 'package:adab/Providers/api_service.dart';
import 'package:adab/Providers/colors.dart';
import 'package:adab/Screens/detail_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';


class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  ApiService apiService;
  BuildContext context;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return  FutureBuilder(
        future: apiService.get(),
        builder: (BuildContext context, AsyncSnapshot<List<Video>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Image.asset(
            'assets/images/splash.gif',
            width: 200,
           
          ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Video> videos = snapshot.data;
            return StoryList(list: videos,);
          } else {
            return Center(
              child: Image.asset(
            'assets/images/splash.gif',
            width: 200,
           
          ),
            );
          }
        },
      );



  }
}


class StoryList extends StatelessWidget {
  const StoryList({Key key, this.list}) : super(key: key);

final List<Video> list;

  @override
  Widget build(BuildContext context) {
        final myColors = Provider.of<MyColors>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int i) {
        Video l = list[i];
          return Parent(
      style: ParentStyle()
        ..width(180)
        ..borderRadius(all: 25)
        ..border(
          all: 3.5,
          color: myColors.multiColors[Random().nextInt(4)],
        )
        ..elevation(1)
        ..margin(left: 5, bottom: 5,right: 10),
      child: Parent(
        style: ParentStyle()
          ..background.image(
              url: 'https://img.youtube.com/vi/${l.imgUrl}/maxresdefault.jpg',
              fit: BoxFit.fill)
          ..border(all: 2, color: Colors.white)
          ..borderRadius(all: 22)
          ..ripple(true),
        child: Center(
            child: Parent(
          style: ParentStyle()
            ..circle(true)
            ..background.color(
                myColors.multiColors[Random().nextInt(4)].withOpacity(.8))
            ..padding(all: 10)
            ..elevation(2),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        )),
      ),
      gesture: Gestures()
        ..isTap(
          (isPressed){ 
          
            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: DetailScreen(id: l.id.toString(),title:l.title,imgUrl: l.imgUrl,catId: l.catname,body: l.body,)));

}
          ));

     },
    );
  }
}