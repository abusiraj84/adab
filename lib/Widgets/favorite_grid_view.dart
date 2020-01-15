import 'package:achievement_view/achievement_view.dart';
import 'package:adab/Screens/detail_screen.dart';
import 'package:adab/db/favorite_model.dart';
import 'package:adab/db/helper_presenter.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FavoriteGridView extends StatefulWidget {
  const FavoriteGridView({Key key}) : super(key: key);

  @override
  _FavoriteGridViewState createState() => _FavoriteGridViewState();
}

class _FavoriteGridViewState extends State<FavoriteGridView>
    implements HomeContract {
  HomePresenter homePresenter;

  @override
  void initState() {
    super.initState();
    homePresenter = HomePresenter(this);
  }

  @override
  void screenUpdate() {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Favorites>>(
        future: homePresenter.getFavorites(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return FavList(snapshot.data, homePresenter);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError &&
              snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.sentiment_dissatisfied),
                  Text("Something went wrong ${snapshot.error}"),
                  FlatButton(
                    child: Text("Retry"),
                    onPressed: () {},
                  )
                ],
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.sentiment_neutral),
                  Text("Waiting on things to start...")
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class FavList extends StatefulWidget {
  FavList(this.favorites, this.homePresenter);

  final List<Favorites> favorites;
  final HomePresenter homePresenter;

  @override
  _FavListState createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    return widget.favorites.length == 0
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text('لا توجد فيديوهات في المفضلة')
              ],
            ),
          )
        : ListView.builder(
            itemCount: widget.favorites == null ? 0 : widget.favorites.length,
            itemBuilder: (BuildContext context, int i) {
              return Dismissible(
                key: GlobalKey(),
                child: ListTile(
                  title: GestureDetector(
                    onTap: () {
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: DetailScreen(id: widget.favorites[i].id.toString(),title:widget.favorites[i].title,imgUrl: widget.favorites[i].imagePath,body: widget.favorites[i].body,)));
                        },
                                      child: Parent(
                      style: ParentStyle()
                        ..borderRadius(all: 10)
                        ..height(200)
                        ..margin(bottom: 20)
                        ..elevation(1)
                        ..background.image(
                            url:
                                'https://img.youtube.com/vi/${widget.favorites[i].imagePath}/maxresdefault.jpg',
                            fit: BoxFit.cover),
                      child: Center(
                        child: Parent(
                          style: ParentStyle()
                            ..circle(true)
                            ..background.color(Colors.white)
                            ..padding(all: 5)
                            ..elevation(1),
                          child: Icon(
                            Icons.play_arrow,
                            size: 40,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                background: Container(
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                direction: DismissDirection.startToEnd,
                onDismissed: (dirction) {
                  widget.homePresenter.delete(widget.favorites[i].id);
                  AchievementView(context,
                      title: "تمت عملية الحذف",
                      subTitle: "",
                      //onTab: _onTabAchievement,
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
                      //borderRadius: 5.0,
                      color: Colors.amber,
                      textStyleTitle: TextStyle(fontSize: 13),
                      textStyleSubTitle: TextStyle(fontSize: 12),
                      alignment: Alignment.center,
                      duration: Duration(seconds: 1),
                      //isCircle: false,
                      listener: (status) {
                    if (widget.favorites.length == 0) {
                      setState(() {});
                    }
                    //print(status);
                    //AchievementState.opening
                    //AchievementState.open
                    //AchievementState.closing
                    //AchievementState.closed
                  })
                    ..show();
                },
              );
            },
          );
  }
}
