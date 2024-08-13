import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../provider/favorites_provider.dart';
import '../models/product.dart';

import 'CartProductCard.dart';
import 'details.dart';

class MyCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartProvider.cartItems[index];
          final product = cartItem['product'] as Product;
          final color = cartItem['color'] as Color;
          final quantity = cartItem['quantity'] as int;

          return CartProductCard(
            product: product,
            color: color,
            quantity: quantity,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    product: product,
                    addToFavorites: (Product product) {
                      favoritesProvider.addToFavorites(product);
                    },
                    removeFromFavorites: (Product product) {
                      favoritesProvider.removeFromFavorites(product);
                    },
                    initialColor: color,
                    initialQuantity: quantity,
                  ),
                ),
              );
            },
            onRemove: () {
              cartProvider.removeProduct(product);
            },
          );
        },
      ),
    );
  }
}
