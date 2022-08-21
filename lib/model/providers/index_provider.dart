import 'package:flutter/cupertino.dart';

class Indexprovider extends ChangeNotifier{
  int _selectedItem = 0;
  void onTapped(int index){
    _selectedItem = index;
    notifyListeners();
  }
  get selectedItem => _selectedItem;
}