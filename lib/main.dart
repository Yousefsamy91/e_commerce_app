import 'package:e_commerce_app/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/provider/cart_provider.dart';
import 'package:e_commerce_app/provider/favorites_provider.dart';

import 'pages/login.dart';
import 'pages/mycart.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/my-cart': (context) => MyCartPage(),
        '/login':(context) => LoginPage(),
        '/register':(context) => RegisterPage(),
      },
      home: LoginPage(),
    );
  }
}
