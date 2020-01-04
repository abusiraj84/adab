class Favorites {
  String title;
  String imagePath;

  int id;
  Favorites(this.id, this.title, this.imagePath);
  Favorites.map(dynamic obj) {
    this.title = obj['title'];
    this.imagePath = obj['imagePath'];
    this.id = obj['id'];
  }

  String get _title => title;
  String get _imagePath => imagePath;
  int get _id => id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['title'] = _title;
    map['imagePath'] = _imagePath;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Favorites.fromMap(Map<String, dynamic> map) {
    this.title = map['title'];
    this.imagePath = map['imagePath'];
    this.id = map['id'];
  }

  void setFavoritesId(int id) {
    this.id = id;
  }
}
