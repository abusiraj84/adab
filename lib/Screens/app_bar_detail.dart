import 'package:division/division.dart';
import 'package:flutter/material.dart';

class AppBarDetailScreen extends StatelessWidget {
  const AppBarDetailScreen({Key key}) : super(key: key);

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
          Row(
            children: <Widget>[
              //       Parent(
              // style: ParentStyle()
              //   ..background.color(Colors.grey.shade300)
              //   ..elevation(1)
              //   ..borderRadius(all: 50),
              // child: Parent(
              //     style: ParentStyle()
              //       ..circle(true)
              //       ..ripple(true)
              //       ..padding(all: 8)
              //       ..borderRadius(all: 50),
              //     child: Icon(
              //       Icons.favorite,
              //       color: Colors.red,
              //       size: 15,
              //     )),
              // gesture: Gestures()
              //   ..isTap(
              //       (isPressed) => Navigator.pushNamed(context, '/favorite'))),
                    SizedBox(
                      width: 20,
                    ),
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
                  gesture: Gestures()..isTap((isPressed) => Navigator.pop(context))),
            ],
          )
        ],
      ),
    );
  }
}
