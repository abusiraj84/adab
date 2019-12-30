import 'package:flutter/material.dart';

import 'app_bar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Column(
          children: <Widget>[
            //appbar
            AppBarScreen(),


          ],
        ),
      ),
    );
  }
}