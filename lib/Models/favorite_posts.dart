import 'package:api_null_safety/Models/user_model.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  List<String> _favorite = [];
  List<String> get favorite => _favorite;

  void favoriteItemAdd(String postsList) {
    _favorite.add(postsList.toString());
    notifyListeners();
  }
}
