import 'package:adab/Modals/video.dart';
import 'package:adab/Providers/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/videos.dart';

import '../Widgets/trend_item.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingVideos extends StatefulWidget {
  @override
  _TrendingVideosState createState() => _TrendingVideosState();
}

class _TrendingVideosState extends State<TrendingVideos> {
  ApiService apiService;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
apiService = ApiService();
  }
  @override
  Widget build(BuildContext context) {
    final videosData = Provider.of<Videos>(context);
    final list = videosData.list;
    SharedPreferences prefs;

    return Parent(
      style: ParentStyle()
        ..height(290)
        ..background.color(Colors.white)
        ..margin(top: 15, right: 10, bottom: 15)
        ..borderRadius(topRight: 30, bottomRight: 30)
        ..boxShadow(color: Colors.grey.shade300, blur: 10, spread: 10),
      child: Column(
        children: <Widget>[
          Parent(
            style: ParentStyle()..margin(bottom: 10)..margin(all: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'آخر الإضافات',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  'الكل',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            height: 230,
            child: FutureBuilder(
              future: apiService.get() ,
            
              builder: (BuildContext context, AsyncSnapshot<List<Video>> snapshot) {
                 if (snapshot.hasError) {
            return Align(
               alignment: Alignment.topCenter,
                            child: Image.asset(
            'assets/images/loadfinal.gif',
            width: 700,
           
          ),
             );}  else if (snapshot.connectionState == ConnectionState.done) {
            List<Video> videos = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int i) {
                List<Video> list = snapshot.data;
                return ChangeNotifierProvider.value(
                  value: list[i],
                  child: TrendItem(id: list[i].id,title:list[i].title,imgUrl: list[i].imgUrl,catname:list[i].catname));
              },
            );
          }else{
             return Align(
               alignment: Alignment.topCenter,
                            child: Image.asset(
            'assets/images/loadfinal.gif',
            width: 700,
           
          ),
             );
          }
                
              },
            ),
          )
        ],
      ),
    );
  }
}
