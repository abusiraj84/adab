import 'package:adab/Providers/colors.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarScreen extends StatelessWidget {
  const AppBarScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final myColors = Provider.of<MyColors>(context,listen: false);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Text('الأدب الخالد',style: TextStyle(fontWeight: FontWeight.bold,color: myColors.yellow,fontSize: 20),),
          Spacer(),
          Parent(
            style: ParentStyle()..background.color(Colors.grey.shade300)..elevation(1)..borderRadius(all: 50),
            child: Parent(style:ParentStyle()..circle(true)..ripple(true)..padding(all: 8)..borderRadius(all: 50), child: Icon(Icons.favorite,color: Colors.red,size: 15,)),
          )
          
        ],
      ),
    );
  }
}
