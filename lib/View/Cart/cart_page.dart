import 'package:e_commerce/Controller/provider/cart_provider.dart';
import 'package:e_commerce/Controller/services/payment.dart';
import 'package:e_commerce/View/Cart/widget/checkout_section.dart';
import 'package:e_commerce/widget/dialogs/material_dialogs.dart';
import 'package:e_commerce/widget/dialogs/widgets/buttons/icon_button.dart';
import 'package:e_commerce/widget/dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import 'components/cart_empty.dart';
import 'components/cart_product_card.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/CartScreen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    StripeService.init();
  }

  void payWithCard({int? amount}) async {
    ProgressDialog dialog = ProgressDialog(context: context);
    // dialog.(message: 'Please wait...');
    await dialog.show(max: 1, msg: 'Please wait...');
    var response = await StripeService.payWithNewCard(
        currency: 'USD', amount: amount.toString());
    dialog.close();
    print('response : ${response.message}');
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message!),
      duration: Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            bottomSheet: CheckOutSection(
                cartProvider.totalAmount, cartProvider.totalAmount),
            appBar: AppBar(
              title: Text("Cart (${cartProvider.getCartItems.length})"),
              actions: [
                IconButton(
                    onPressed: () {
                      _showDialog(() {
                        cartProvider.clearCardItems();
                        Navigator.pop(context);
                      }, 'Are you sure? you can\'t undo this action',
                          "Delete all Items!", context);
                    },
                    icon: Icon(Icons.delete_outline))
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: cartProvider.getCartItems.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ChangeNotifierProvider.value(
                      value: cartProvider.getCartItems.values.toList()[index],
                      child: CartProductCard(
                        productId:
                            cartProvider.getCartItems.keys.toList()[index],
                        // id:  cartProvider.getCartItems.values.toList()[index].id,
                        // productId: cartProvider.getCartItems.keys.toList()[index],
                        // price: cartProvider.getCartItems.values.toList()[index].price,
                        // title: cartProvider.getCartItems.values.toList()[index].title,
                        // imageUrl: cartProvider.getCartItems.values.toList()[index].imageUrl,
                        // quatity: cartProvider.getCartItems.values.toList()[index].quantity,
                      ),
                    );
                  }),
            ),
          );
  }

  _showDialog(onPressed, String msg, String title, BuildContext context) {
    Dialogs.bottomMaterialDialog(
        msg: msg,
        title: title,
        context: context,
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Cancel',
            iconData: Icons.cancel_outlined,
            textStyle: TextStyle(color: Colors.grey),
            iconColor: Colors.grey,
          ),
          IconsButton(
            onPressed: onPressed,
            text: 'Delete',
            iconData: Icons.delete,
            color: Colors.red,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }
}
