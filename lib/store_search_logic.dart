import 'package:flutter/material.dart';
import 'package:med_sci_library/models/data.dart';

class SearchProvider extends ChangeNotifier {
  final List<AppContent> _allContent = [
    AppContent(title: 'Home', route: '/home', category: ""),
  ];
  List<AppContent> _filteredResults = [];
  List<AppContent> get filteredResults => _filteredResults;

  void search(String query) {
    if (query.isEmpty) {
      _filteredResults = [];
    } else {
      _filteredResults =
          _allContent
              .where(
                (item) =>
                    item.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
      notifyListeners();
    }
  }
}
