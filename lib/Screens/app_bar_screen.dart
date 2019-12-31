import 'package:adab/Providers/colors.dart';
import 'package:adab/Screens/fovrites_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AppBarScreen extends StatelessWidget {
  const AppBarScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final myColors = Provider.of<MyColors>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          //Text('الأدب الخالد',style: TextStyle(fontWeight: FontWeight.bold,color: myColors.yellow,fontSize: 20),),
          Image.asset('assets/images/logo.png',width: 80,color: Colors.amber.shade500,),
          Spacer(),
          Parent(
            style: ParentStyle()..background.color(Colors.grey.shade300)..elevation(1)..borderRadius(all: 50),
            child: Parent(style:ParentStyle()..circle(true)..ripple(true)..padding(all: 8)..borderRadius(all: 50), child: Icon(Icons.favorite,color: Colors.red,size: 15,)),
            gesture: Gestures()
      ..isTap((isPressed) => Navigator.pushNamed(context, '/favorite')



          ))
          
        ],
      ),
    );
  }
}
