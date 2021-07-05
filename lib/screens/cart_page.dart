import 'package:e_commerce/widget/checkput_section.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widget/cart_empty.dart';
import 'package:e_commerce/widget/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List products = [];
    return !products.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            bottomSheet: CheckOutSection(),
            appBar: AppBar(
              title: Text("Cart Items Count"),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline))
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 70),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return CartProductCard();
                },
              ),
            ),
          );
  }
}
