import 'dart:async';

import 'package:adab/Screens/home_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    // Fades between routes. (If you don't want any animation, 
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}


class _SplashScreenState extends State<SplashScreen> {
  void navigationPage(){
    Navigator.push(context, MyCustomRoute(builder: (context)=> HomeScreen()));
  }

  startTime()async{
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E3E3),
      body: Center(
        child: Container(
          color: Colors.grey.shade300,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
            Image.asset(
              'assets/images/splash.gif',
              width: 300,
            
            ),
             Image.asset(
              'assets/images/load.gif',
              width: 300,
            
            ),
SizedBox(
  height: 60,
),
            Parent(
              style: ParentStyle()..width(double.infinity)..height(40)..background.color(Colors.white.withOpacity(0.0)),
              child: Center(child: Txt('جميع الحقوق محفوظة 2020',style: TxtStyle()..fontSize(11)..textColor(Colors.blue.shade700),)),
            )
           ],
         ),
    ),
      ),
    );
  }
}