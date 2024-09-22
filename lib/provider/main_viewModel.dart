import 'package:flutter/material.dart';

class MainViewModel with ChangeNotifier {
  final String roleId = '0';
  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;

  void selectPage(int index) {
    _selectedPageIndex = index;
    notifyListeners(); // Thông báo cho các widget đang lắng nghe
  }
}
