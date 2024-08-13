import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favorites_provider.dart';
import '../config/big_card.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoriteProducts = favoritesProvider.favoriteProducts;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favoriteProducts.isEmpty
          ? Center(child: Text('No favorite products yet.'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return ProductCard(
                    name: product.name,
                    imageUrl: product.imageUrl,
                    price: product.price,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
    );
  }
}
