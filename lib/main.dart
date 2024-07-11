import 'package:flutter/material.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
