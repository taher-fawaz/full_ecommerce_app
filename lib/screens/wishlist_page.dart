import 'package:e_commerce/constants/my_icons.dart';
import 'package:e_commerce/provider/favs_provider.dart';
import 'package:e_commerce/services/global_method.dart';
import 'package:e_commerce/widget/checkput_section.dart';
import 'package:e_commerce/widget/wishlist_empty.dart';
import 'package:e_commerce/widget/wishlist_full.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widget/cart_empty.dart';
import 'package:e_commerce/widget/cart_product_card.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = '/WishListScreen';

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final favsProvider = Provider.of<FavsProvider>(context);
    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist (${favsProvider.getFavsItems.length})'),
              actions: [
                IconButton(
                  onPressed: () {
                    globalMethods.showDialogg(
                        'Clear wishlist!',
                        'Your wishlist will be cleared!',
                        () => favsProvider.clearFavs(),
                        context);
                    // cartProvider.clearCart();
                  },
                  icon: Icon(AppIcons.trash),
                )
              ],
            ),
            body: ListView.builder(
              itemCount: favsProvider.getFavsItems.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ChangeNotifierProvider.value(
                    value: favsProvider.getFavsItems.values.toList()[index],
                    child: WishlistFull(
                      productId: favsProvider.getFavsItems.keys.toList()[index],
                    ));
              },
            ),
          );
  }
}
