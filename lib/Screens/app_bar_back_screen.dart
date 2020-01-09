import 'package:division/division.dart';
import 'package:flutter/material.dart';

class AppBarBackScreen extends StatelessWidget {
  const AppBarBackScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            width: 80,
            color: Colors.red.shade800,
          ),
          Spacer(),
          Parent(
              style: ParentStyle()
                ..background.color(Colors.grey.shade300)
                ..elevation(1)
                ..borderRadius(all: 50),
              child: Parent(
                  style: ParentStyle()
                    ..circle(true)
                    ..ripple(true)
                    ..padding(all: 8)
                    ..borderRadius(all: 50),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black87,
                    size: 15,
                  )),
              gesture: Gestures()..isTap((isPressed) => Navigator.pop(context)))
        ],
      ),
    );
  }
}
