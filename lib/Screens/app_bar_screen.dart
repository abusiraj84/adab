import 'package:adab/Providers/cat_tab_prov.dart';
import 'package:adab/Screens/fovrites_screen.dart';
import 'package:adab/db/helper_presenter.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'package:url_launcher/url_launcher.dart';
 
class AppBarScreen extends StatefulWidget {
  const AppBarScreen({Key key}) : super(key: key);

  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> implements HomeContract {
  var count;
  HomePresenter homePresenter;

  @override
  void initState() {
    super.initState();
    homePresenter = HomePresenter(this);
  }

  @override
  void screenUpdate() {}

  ff() {
    return FutureBuilder(
      future: homePresenter.getCount(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        count = snapshot.data;
        return Text(count.toString());
      },
    );
  }

_youtube() async {
  const url = 'https://www.youtube.com/channel/UCqFzK-bk6V73uUOsSVjvNgg';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_insta() async {
  const url = 'https://www.instagram.com/aladabalkhaled';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    final tabsIndex = Provider.of<TabsIndex>(context);

    return Parent(
      style: ParentStyle()
        ..background.color(Colors.white)
        ..padding(top: 30)
        ..margin(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            //Text('الأدب الخالد',style: TextStyle(fontWeight: FontWeight.bold,color: myColors.yellow,fontSize: 20),),
            Image.asset(
              'assets/images/logoAnim.gif',
              width: 80,
              color: Colors.yellow[800],
            ),
                           GestureDetector(
                 onTap: (){
                   setState(() {
                     
                   });
                 },
                              child: Parent(
                  style: ParentStyle()
                    ..background.color(Colors.grey.shade300)
                    ..elevation(1)
                    ..borderRadius(all: 50),
                  child: Parent(
                      style: ParentStyle()
                        ..circle(true)
                        ..padding(all: 8)
                        ..borderRadius(all: 50),
                      child: Icon(
                        FontAwesomeIcons.upload,
                        color: Colors.red,
                        size: 15,
                      )),
                ),
              ),
         
            Spacer(),
                GestureDetector(
                 onTap: _youtube,
                              child: Parent(
                  style: ParentStyle()
                    ..background.color(Colors.grey.shade300)
                    ..elevation(1)
                    ..borderRadius(all: 50),
                  child: Parent(
                      style: ParentStyle()
                        ..circle(true)
                        ..padding(all: 8)
                        ..borderRadius(all: 50),
                      child: Icon(
                        FontAwesomeIcons.youtube,
                        color: Colors.red,
                        size: 15,
                      )),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              GestureDetector(
                 onTap: _insta,
                              child: Parent(
                  style: ParentStyle()
                    ..background.color(Colors.grey.shade300)
                    ..elevation(1)
                    ..borderRadius(all: 50),
                  child: Parent(
                      style: ParentStyle()
                        ..circle(true)
                        ..padding(all: 8)
                        ..borderRadius(all: 50),
                      child: Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.red,
                        size: 15,
                      )),
                ),
              ),
              SizedBox(
                width: 12,
              ),
            Badge(
              badgeContent: ff(),
              badgeColor: Colors.amber,
              child: GestureDetector(
                 onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: FavoriteScreen()));
                  },
                              child: Parent(
                  style: ParentStyle()
                    ..background.color(Colors.grey.shade300)
                    ..elevation(1)
                    ..borderRadius(all: 50),
                  child: Parent(
                      style: ParentStyle()
                        ..circle(true)
                        ..padding(all: 8)
                        ..borderRadius(all: 50),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 15,
                      )),
                ),
              ),
       
            ),
         
         
          ],
        ),
      ),
    );
  }
}
