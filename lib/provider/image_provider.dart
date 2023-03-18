import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:react_image/model/image.dart';

class ImagePr extends ChangeNotifier {
  List<ImageModel> _list = [];
  int _countFavorites = 0;

  int get countFavorites {
    return _countFavorites;
  }

  List<ImageModel> get list {
    return [..._list];
  }

  List<ImageModel> getFavorite() {
    List<ImageModel> list = _list.where((item) => item.isFavorite).toList();
    return list.isEmpty ? [] : list;
  }

  void handleCountFavorites() {
    _countFavorites = _list.where((item) => item.isFavorite).length;
    notifyListeners();
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString("assets/json/imageList.json");
    final parseList = await json.decode(response);
    List<ImageModel> dataList = List<ImageModel>.from(
        parseList.map((data) => ImageModel.fromJson(jsonEncode(data))));
    _list = dataList;
    notifyListeners();
  }
}
