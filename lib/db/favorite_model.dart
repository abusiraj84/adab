class Favorites {
  String title;
  String imagePath;
  String body;

  int id;
  Favorites(this.id, this.title, this.imagePath,this.body);
  Favorites.map(dynamic obj) {
    this.title = obj['title'];
    this.imagePath = obj['imagePath'];
    this.body = obj['body'];
    this.id = obj['id'];
  }

  String get _title => title;
  String get _imagePath => imagePath;
  String get _body => body;
  int get _id => id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['title'] = _title;
    map['imagePath'] = _imagePath;
    map['body'] = _body;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Favorites.fromMap(Map<String, dynamic> map) {
    this.title = map['title'];
    this.imagePath = map['imagePath'];
    this.body = map['body'];
    this.id = map['id'];
  }

  void setFavoritesId(int id) {
    this.id = id;
  }
}
