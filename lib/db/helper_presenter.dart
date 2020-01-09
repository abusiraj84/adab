import 'package:adab/db/database_helper.dart';
import 'package:adab/db/favorite_model.dart';
import 'dart:async';

abstract class HomeContract {
  void screenUpdate();
}

class HomePresenter {
  HomeContract _view;
  var db = DatabaseHelper();
  HomePresenter(this._view);
  delete(int id) {
    var db = DatabaseHelper();
    db.deleteFavorite(id);
    updateScreen();
  }

  Future<List<Favorites>> getFavorites() {
    return db.getFavorites();
  }

    Future<int> getCount() {
     return db.getCount();

  }


  Future<bool> isItRecord(id) {
    return db.isItRecord(id);
  }

  updateScreen() {
    _view.screenUpdate();
  }

}
