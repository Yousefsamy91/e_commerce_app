import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/models/product.dart';
import '../provider/cart_provider.dart';
import '../provider/favorites_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  final Color initialColor;
  final int initialQuantity;

  const ProductDetailsPage({
    Key? key,
    required this.product,
    required this.initialColor,
    required this.initialQuantity,
    required this.addToFavorites,
    required this.removeFromFavorites,
  }) : super(key: key);

  final Function(Product) addToFavorites;
  final Function(Product) removeFromFavorites;

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int? selectedCircleIndex;
  int quantity = 1;

  final List<Color> circleColors = [
    Colors.red,
    Colors.grey,
    Colors.blue,
    Colors.black,
    Colors.orange,
  ];

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
    selectedCircleIndex = circleColors.indexOf(widget.initialColor);
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final isFavorite = favoritesProvider.isFavorite(widget.product);
    final double rating = 4.5;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: Image.asset(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Apple iPhone 13 pro designed to last by the best.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star_half, color: Colors.yellow, size: 24),
                      SizedBox(width: 8.0),
                      Text(
                        '$rating',
                        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  indent: 16.0,
                  endIndent: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(circleColors.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCircleIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.0),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: circleColors[index],
                                shape: BoxShape.circle,
                                border: selectedCircleIndex == index
                                    ? Border.all(color: Colors.black, width: 2)
                                    : null,
                              ),
                            ),
                          );
                        }),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove, color: Colors.black),
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                            ),
                            Container(
                              color: Colors.grey,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                quantity.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add, color: Colors.black),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      cartProvider.addProduct(
                        widget.product,
                        selectedCircleIndex != null
                            ? circleColors[selectedCircleIndex!]
                            : Colors.transparent,
                        quantity,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/my-cart', (route) => route.isFirst);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  if (isFavorite) {
                    favoritesProvider.removeFromFavorites(widget.product);
                  } else {
                    favoritesProvider.addToFavorites(widget.product);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
