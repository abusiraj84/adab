import 'package:adab/Providers/cat_tab_prov.dart';
import 'package:adab/Providers/colors.dart';
import 'package:adab/Screens/fovrites_screen.dart';
import 'package:adab/db/helper_presenter.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';


class AppBarScreen extends StatefulWidget {
  const AppBarScreen({Key key}) : super(key: key);
  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> implements HomeContract {

  HomePresenter homePresenter;
  var count;


  @override
  void initState() {
    super.initState();
    homePresenter = HomePresenter(this);
    

  }

  @override
  Widget build(BuildContext context) {
    final tabsIndex = Provider.of<TabsIndex>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          //Text('الأدب الخالد',style: TextStyle(fontWeight: FontWeight.bold,color: myColors.yellow,fontSize: 20),),
          Image.asset(
            'assets/images/logoAnim.gif',
            width: 80,
            color: Colors.yellow[800],
          ),
          Spacer(),
          Badge(badgeContent: ff() ,

          badgeColor: Colors.amber,
                      child: Parent(
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
                      Icons.favorite,
                      color: Colors.red,
                      size: 15,
                    )),
                gesture: Gestures()
                  ..isTap(
                      (isPressed) => Navigator.pushNamed(context, '/favorite'))),
          )
        ],
      ),
    );
  }
     ff() {
  return FutureBuilder(
    future:  homePresenter.getCount(),
    
    builder: (BuildContext context, AsyncSnapshot snapshot) {

     
      count =snapshot.data;
      return Text(count.toString());
    },
  );
   
    }

    


  @override
  void screenUpdate() {
   
  }
}
