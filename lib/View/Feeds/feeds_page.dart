import 'package:badges/badges.dart';
import 'package:e_commerce/Controller/provider/cart_provider.dart';
import 'package:e_commerce/View/Feeds/components/feeds_grid.dart';
import 'package:e_commerce/Controller/constants/colors.dart';
import 'package:e_commerce/Controller/constants/my_icons.dart';
import 'package:e_commerce/Controller/provider/favs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Cart/cart_page.dart';
import '../Wishlist/wishlist_page.dart';

class FeedsScreen extends StatelessWidget {
  static const String routeName = '/feedsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          title: Text('Feeds'),
          actions: [
            Consumer<FavsProvider>(
              builder: (_, favs, ch) => Badge(
                badgeColor: ColorsConsts.cartBadgeColor,
                animationType: BadgeAnimationType.slide,
                toAnimate: true,
                position: BadgePosition.topEnd(top: 5, end: 7),
                badgeContent: Text(
                  favs.getFavsItems.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(WishListScreen.routeName);
                  },
                ),
              ),
            ),
            Consumer<CartProvider>(
              builder: (_, cart, ch) => Badge(
                badgeColor: ColorsConsts.cartBadgeColor,
                animationType: BadgeAnimationType.slide,
                toAnimate: true,
                position: BadgePosition.topEnd(top: 5, end: 7),
                badgeContent: Text(
                  cart.getCartItems.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  icon: AppIcons.cart,
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
              ),
            ),
          ],
        ),
        body: FeedsGrid());
  }
}
