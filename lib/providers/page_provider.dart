import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));

    html.document.title = _pages[getPageIndex(routeName)];

    scrollController.addListener(() {
      final pageIndex = (scrollController.page ?? 0).round();

      if (pageIndex != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[pageIndex]}');
        _currentIndex = pageIndex;
        html.document.title = _pages[_currentIndex]; 
      }
    });
  }

  getPageIndex(String routeName) {
    return _pages.indexOf(routeName) == -1 ? 0 : _pages.indexOf(routeName);
  }

  void setPage(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void goTo(int index) {
    // final routeName = _pages[index];
    // html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    scrollController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
