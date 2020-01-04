import 'package:adab/Providers/videos.dart';
import 'package:provider/provider.dart';

import '../Widgets/story_item.dart';
import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videosData = Provider.of<Videos>(context);
    final list = videosData.list;

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int i) {
        return StoryItem(id: list[i].id, imgUrl: list[i].imgUrl);
      },
    );
  }
}
