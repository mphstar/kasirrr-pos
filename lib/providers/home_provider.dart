import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String querySearch = '';

  void setQuerySearch({required String search}){
    querySearch = search;
    notifyListeners();
  }
}