import 'package:e_commerce/widget/checkput_section.dart';
import 'package:e_commerce/widget/wishlist_empty.dart';
import 'package:e_commerce/widget/wishlist_full.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widget/cart_empty.dart';
import 'package:e_commerce/widget/cart_product_card.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = '/WishListScreen';

  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return !wishlistList.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            bottomSheet: CheckOutSection(),
            appBar: AppBar(
              title: Text("wish Items"),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline))
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 70),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return WishlistFull();
                },
              ),
            ),
          );
  }
}
