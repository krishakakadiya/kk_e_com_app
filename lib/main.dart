import 'package:flutter/material.dart';
import 'package:kk_e_com_app/screens/cart_page.dart';
import 'package:kk_e_com_app/screens/detail_page.dart';
import 'package:kk_e_com_app/screens/fav_page.dart';
import 'package:kk_e_com_app/screens/home_page.dart';

void main() {
  runApp(
    EcomApp(),
  );
}

class EcomApp extends StatelessWidget {
  const EcomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'detail_page': (context) => DetailPage(),
        'cart_page': (context) => CartPage(),
        'fav_page': (context) => FavPage(),
      },
    );
  }
}
