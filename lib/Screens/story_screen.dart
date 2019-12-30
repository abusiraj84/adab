import '../Modals/videos.dart';

import '../Widgets/story_item.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {
     final List<Videos> list = [
      Videos(id: 1,imgUrl:   'https://images.pexels.com/photos/3171834/pexels-photo-3171834.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',),
      Videos(id: 1,imgUrl:   'https://images.pexels.com/photos/3361739/pexels-photo-3361739.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',),
      Videos(id: 1,imgUrl:   'https://images.pexels.com/photos/2004930/pexels-photo-2004930.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',),
      Videos(id: 1,imgUrl:   'https://images.pexels.com/photos/3361480/pexels-photo-3361480.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',),
      Videos(id: 1,imgUrl:   'https://images.pexels.com/photos/3290071/pexels-photo-3290071.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',),
    ];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int i) {
      return  StoryItem(id: list[i].id,imgUrl:  list[i].imgUrl);
     },
    );
  }
}
