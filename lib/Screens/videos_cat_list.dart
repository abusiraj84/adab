import 'package:adab/Modals/cat.dart';
import 'package:adab/Modals/video.dart';
import 'package:adab/Providers/api_service.dart';
import 'package:adab/Providers/cat_tab_prov.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideosCatLsit extends StatefulWidget {
  @override
  _VideosCatLsitState createState() => _VideosCatLsitState();
}

class _VideosCatLsitState extends State<VideosCatLsit> {
  ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
        TabsIndex tabsIndex = Provider.of<TabsIndex>(context);

    return Column(
      children: <Widget>[
        Container(
          height: 55,
          child: FutureBuilder<List<Cat>>(
            future: apiService.getCats(),
            builder: (BuildContext context, AsyncSnapshot<List<Cat>> snapshot) {
               if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData?
              
       ListView.builder(
            itemCount: snapshot.data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int i) {
                  if (snapshot.hasError) print(snapshot.error);

              return 
                   snapshot.data.length== null ?Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      CircularProgressIndicator(),
      SizedBox(
        height: 20,
      ),
      Text('لا توجد فيديوهات ')
    ],
    ),):
               CatList(
                  catId: snapshot.data[i].id, catName: snapshot.data[i].title, i: i);
            },
          ):Align(
             alignment: Alignment.topCenter,
                          child: Image.asset(
          'assets/images/loadcats.gif',
          width: 700,
         
        ),
           );
            },
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Video>>(
            future: apiService.getbyCatId(tabsIndex.index+1),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ?  VideoGridView(list: snapshot.data)
                  :Align(
             alignment: Alignment.topCenter,
                          child: Image.asset(
          'assets/images/loadtabs.gif',
          width: 700,
         
        ),
           );
         
            },
          ),
        )
      ],
    );
  }
}

class CatList extends StatefulWidget {
   CatList({this.catName, this.catId, this.i});

 final String catId;
 final String catName;
 final int i;

  @override
  _CatListState createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  int _currentIndex = 0;
  bool _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = false;
  }

  @override
  Widget build(BuildContext context) {
    TabsIndex tabsIndex = Provider.of<TabsIndex>(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          tabsIndex.index = widget.i;
          print(widget.i);
          
        });
      },
      child: Parent(
          style: ParentStyle()
            ..margin(all: 10)
            ..background.color(tabsIndex.index == widget.i
                ? Colors.amber
                : Colors.grey.shade300)
            ..borderRadius(all: 10)
            ..elevation(0),
          child: Center(
              child: Txt(
            widget.catName,
            style: TxtStyle()
              ..fontWeight(FontWeight.bold)
              ..padding(horizontal: 10, vertical: 0)
              ..textColor(tabsIndex.index == widget.i
                  ? Colors.grey.shade800
                  : Colors.grey.shade500),
          ))),
    );
  }
}

class VideoGridView extends StatefulWidget {
  VideoGridView({Key key, this.list}) : super(key: key);

 final List<Video> list;

  @override
  _VideoGridViewState createState() => _VideoGridViewState();
}

class _VideoGridViewState extends State<VideoGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only( right:16.0,left: 16),
      child: widget.list.length == 0? Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
     height: 40,
   ),

       Image.asset(
            'assets/images/loadtabs.gif',
            width: 50,
           
          ),
   SizedBox(
     height: 20,
   ),
        Text('لا توجد فيديوهات ')
      ],
    ),):GridView.builder(
        itemCount: widget.list.length,
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
          childAspectRatio: 1.25
          
        ),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 20,
                      child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Parent(
                  style: ParentStyle()
                  ..background.color(Colors.amber)
                  ..elevation(3)
                  ..borderRadius(all: 20)
                  ..margin(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                      'https://img.youtube.com/vi/${widget.list[index].imgUrl}/maxresdefault.jpg',fit: BoxFit.cover,),
                  ),
                ),
               // Text(widget.list[index].catname),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Text(widget.list[index].title,style: TextStyle(fontSize: 12,height: 1.2),),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
