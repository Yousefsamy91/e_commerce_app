import 'package:flutter/material.dart';
import '../models/product.dart';

class FavoritesProvider with ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  void addToFavorites(Product product) {
    _favoriteProducts.add(product);
    notifyListeners();
  }

  void removeFromFavorites(Product product) {
    _favoriteProducts.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favoriteProducts.any((item) => item.id == product.id);
  }
}
