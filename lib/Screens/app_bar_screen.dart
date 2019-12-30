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
            style: ParentStyle()..circle(true)..background.color(Colors.grey.shade300)..padding(all: 8)..elevation(2),
            child: Icon(Icons.menu,size: 15,),
          )
          
        ],
      ),
    );
  }
}
