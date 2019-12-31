import 'package:adab/Providers/colors.dart';
import 'package:adab/Screens/app_bar_back_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorite_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
static const routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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