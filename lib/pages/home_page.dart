import 'package:flutter/material.dart';
import '../config/samll_card.dart';
import 'favourite.dart';
import 'mycart.dart';
import 'product_list.dart';
import 'details.dart';
import '../models/product.dart';
import '../config/big_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        id: '1',
        name: 'Product 1',
        imageUrl: 'assets/images/televison.png',
        price: 29.99,
        category: 'Electronics',
      ),
      Product(
        id: '2',
        name: 'Product 2',
        imageUrl: 'assets/images/televison.png',
        price: 49.99,
        category: 'Electronics',
      ),
      Product(
        id: '3',
        name: 'Product 3',
        imageUrl: 'assets/images/televison.png',
        price: 99.99,
        category: 'Electronics',
      ),
      Product(
        id: '4',
        name: 'Product 4',
        imageUrl: 'assets/images/televison.png',
        price: 19.99,
        category: 'Electronics',
      ),
      Product(
        id: '5',
        name: 'Product 5',
        imageUrl: 'assets/images/televison.png',
        price: 39.99,
        category: 'Electronics',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "E_shop",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyCartPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.shopping_cart, color: Colors.black),
                      ),
                      SizedBox(width: 4.0),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavoritesPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search products, brands',
                          prefixIcon: Icon(Icons.search),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      onPressed: () {
                      },
                      icon: Image.asset('assets/images/icons8-adjust-16.png'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final category = index % 4 == 0
                        ? 'Phones'
                        : index % 4 == 1
                            ? 'Fashion'
                            : index % 4 == 2
                                ? 'Accessories'
                                : 'Electronics';

                    final imageUrl = index % 4 == 0
                        ? 'assets/images/images.jpeg'
                        : index % 4 == 1
                            ? 'assets/images/download.png'
                            : index % 4 == 2
                                ? 'assets/images/images (1).jpeg'
                                : 'assets/images/televison.png';

                    return small_card(
                      categoryName: category,
                      imageUrl: imageUrl,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductListPage(category: category),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    name: product.name,
                    imageUrl: product.imageUrl,
                    price: product.price,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            product: product,
                            initialColor: Colors.transparent,
                            initialQuantity: 1,
                            addToFavorites: (Product product) {},
                            removeFromFavorites: (Product product) {},
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
