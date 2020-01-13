import '../Screens/app_bar_back_screen.dart';
import '../Widgets/favorite_grid_view.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffeeeeee),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // AppbarBack
            AppBarBackScreen(),

            //FavoriteGridView
            FavoriteGridView()
          ],
        ),
      ),
    );
  }
}
