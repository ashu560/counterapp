import 'package:flutter/material.dart';

class FevProvider with ChangeNotifier {
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;

  void addItem(int index) {
    selectedItem.add(index);
    notifyListeners();
  }

  void removeItem(int index) {
    selectedItem.remove(index);
    notifyListeners();
  }
}
