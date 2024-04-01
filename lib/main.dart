import 'package:e_shopping/Screens/cartpage.dart';
import 'package:e_shopping/Screens/detailpage.dart';
import 'package:e_shopping/Screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        'Homepage': (context) => const Homepage(),
        'Detailpage': (context) => const Detailpage(),
        'Cartpage': (context) => const Cartpage(),
      },
    ),
  );
}
