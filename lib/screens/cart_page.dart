import 'package:flutter/material.dart';
import 'package:market/screens/cart_empty_page.dart';
import 'package:market/screens/cart_full_page.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CartFull());
  }
}
