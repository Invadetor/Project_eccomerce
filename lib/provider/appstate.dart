import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  int _selectedCategory = 0;

  void set selectedCategory(int i) {
    _selectedCategory = i;
    notifyListeners();
  }

  int get selectedCategory => _selectedCategory;
}