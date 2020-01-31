import 'package:flutter/material.dart';
import 'package:polar_ice_app/aboutUs.dart';
import 'package:polar_ice_app/homePage.dart';
import 'package:polar_ice_app/productShowcase.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}