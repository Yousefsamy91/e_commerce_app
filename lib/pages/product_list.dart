import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/product.dart';

class ProductListPage extends StatelessWidget {
  final String category;

  ProductListPage({required this.category});

  final List<Product> products = [
    Product(
      id: 'p1',
      name: 'Phone 1',
      imageUrl: 'assets/images/images.jpeg',
      category: 'Phones',
      price: 3000,
    ),
    Product(
      id: 'p2',
      name: 'Phone 2',
      imageUrl: 'assets/images/images.jpeg',
      category: 'Phones',
      price: 500,
    ),
    Product(
      id: 'p3',
      name: 'Fashion Item 1',
      imageUrl: 'assets/images/download.png',
      category: 'Fashion',
      price: 50.00,
    ),
    Product(
      id: 'p4',
      name: 'Fashion Item 2',
      imageUrl: 'assets/images/download.png',
      category: 'Fashion',
      price: 100.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts =
        products.where((product) => product.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8)),
                    child: Image.asset(
                      product.imageUrl,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
