import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addProduct(Product product, Color color, int quantity) {
    final existingProductIndex = _cartItems.indexWhere(
      (item) => item['product'] == product && item['color'] == color,
    );

    if (existingProductIndex >= 0) {
      _cartItems[existingProductIndex]['quantity'] = quantity;
    } else {
      _cartItems.add({
        'product': product,
        'color': color,
        'quantity': quantity,
      });
    }
    notifyListeners();
  }

  void removeProduct(Product product) {
    _cartItems.removeWhere((item) => item['product'] == product);
    notifyListeners();
  }
}
