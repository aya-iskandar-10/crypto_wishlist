import 'package:flutter/material.dart';

class ControllerWishlist extends ChangeNotifier {
  // symbols of the favorite coins (BTC and ETH start as favorites)
  final Set<String> _favorites = {'BTC', 'ETH'};

  int get count => _favorites.length;

  bool isFavorite(String symbol) {
    return _favorites.contains(symbol);
  }

  void toggle(String symbol) {
    if (_favorites.contains(symbol)) {
      _favorites.remove(symbol);
    } else {
      _favorites.add(symbol);
    }
    notifyListeners();
  }
}
