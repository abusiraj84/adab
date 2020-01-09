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
  final List<Cat> list = [
    Cat(
      catName: 'معلقات',
      catId: 1,
    ),
    Cat(
      catName: 'رومنسيات',
      catId: 2,
    ),
    Cat(catName: 'أدب الهجر', catId: 3),
    Cat(catName: 'الحرب', catId: 4),
    Cat(catName: 'شعر حديث', catId: 5),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 55,
            child: ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int i) {
                return CatList(
                    catId: list[i].catId, catName: list[i].catName, i: i);
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Video>>(
              future: apiService.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? new VideoGridView(list: snapshot.data)
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
      ),
    );
  }
}

class CatList extends StatefulWidget {
  CatList({this.catName, this.catId, this.i});

  int catId;
  String catName;
  int i;

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

  List<Video> list;

  @override
  _VideoGridViewState createState() => _VideoGridViewState();
}

class _VideoGridViewState extends State<VideoGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: widget.list.length == 0? Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        SizedBox(
          height: 20,
        ),
        Text('لا توجد فيديوهات ')
      ],
    ),):GridView.builder(
        itemCount: widget.list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 3/2
        ),
        itemBuilder: (BuildContext context, int index) {
          return Parent(
            style: ParentStyle()
            ..background.color(Colors.amber)
            ..elevation(3)
            ..borderRadius(all: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                'https://img.youtube.com/vi/${widget.list[index].imgUrl}/maxresdefault.jpg',fit: BoxFit.cover,),
            ),
          );
        },
      ),
    );
  }
}
