import 'package:flutter/foundation.dart';
import 'package:softales/data/tale_data.dart';

class SearchProvider with ChangeNotifier {
  String _searchText = '';
  String get searchText => _searchText;

  Future<void> setSearchText(String text) async {
    _searchText = text;
    notifyListeners();
  }
}

class FocusedItemProvider with ChangeNotifier {
  TaleData _focusedTale = TaleData(
    taleId: '',
    title: '',
    image: '',
    description: '',
    tags: [],
  );
  TaleData get focusedTale => _focusedTale;

  Future<void> setFocusedItem(TaleData tale) async {
    _focusedTale = tale;
    notifyListeners();
  }
}