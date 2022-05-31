import 'package:flutter/material.dart';


class PageProvider extends ChangeNotifier {

  PageController scrollController = PageController();
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setPage(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void goTo (int index) {
    scrollController.animateToPage(
      index, 
      duration: Duration(milliseconds: 500), 
      curve: Curves.easeInOut
    );
  }
}