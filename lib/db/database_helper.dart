import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'favorite_model.dart';

class DatabaseHelper {
  static Database _db;
  final String userTable = 'Favorites';
  final String columnId = 'id';
  final String title = 'title';
  final String imagePath = 'imagePath';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await intDB();
    return _db;
  }

  intDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'mydb.db');
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE Favorites (id INTEGER , title TEXT, imagePath TEXT, body TEXT)');
  }

  Future<int> insertMovie(Favorites favorites) async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery('SELECT * from Favorites WHERE id = ?', [favorites.id]);
    int res;

    list.length == 0
        ? res = await dbClient.insert("Favorites", favorites.toMap())
        : {};
  print(favorites.toMap());
 
    return res;
    
  }

  Future<List<Favorites>> getFavorites() async {
    var dbClient = await db;
    var sql = "SELECT * FROM Favorites";
    

    List<Map> list = await dbClient.rawQuery(sql);
    List<Favorites> favorites = List();

    for (var i = 0; i < list.length; i++) {
      var favorite = Favorites(
          list[i]['id'], list[i]['title'], list[i]['imagePath'], list[i]['body']);
      favorite.setFavoritesId(list[i]['id']);
      favorites.add(favorite);
    }
    //print(favorites);
    return favorites;
  }

  Future<int> getCount() async {
    var dbClient = await db;
   List<Map> list = await dbClient.rawQuery('SELECT * FROM Favorites');
int count = list.length;

    // print(count);
     return count;

  }

  Future<Favorites> getUser(int id) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $userTable WHERE $columnId = $id";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;
    return new Favorites.fromMap(result.first);
  }

  Future<int> deleteFavorite(int id) async {
    var dbClient = await db;
    int res = await dbClient
        .rawDelete("DELETE FROM Favorites where $columnId = ?", [id]);
    return res;
  }

  Future<bool> updateFavorites(Favorites favorites) async {
    var dbClient = await db;
    int res = await dbClient.update(userTable, favorites.toMap(),
        where: "id = ?", whereArgs: <int>[favorites.id]);
    return res > 0 ? true : false;
  }

  Future<bool> isItRecord(int id) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $userTable WHERE $columnId = $id";
    List<Map> list = await dbClient.rawQuery(sql);

    return list.length > 0 ? true : false;
  }

  Future<void> close() async {
    var dbClient = await db;
    return await dbClient.close();
  }
}
