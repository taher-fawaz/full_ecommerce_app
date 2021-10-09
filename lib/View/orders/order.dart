import 'package:e_commerce/Controller/constants/colors.dart';
import 'package:e_commerce/Controller/provider/orders_provider.dart';
import 'package:e_commerce/Controller/services/global_method.dart';
import 'package:e_commerce/Controller/constants/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order_empty.dart';
import 'order_full.dart';

class OrderScreen extends StatefulWidget {
  //To be known 1) the amount must be an integer 2) the amount must not be double 3) the minimum amount should be less than 0.5 $
  static const routeName = '/OrderScreen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    // StripeService.init();
  }

  void payWithCard({int? amount}) async {
    // ProgressDialog dialog = ProgressDialog(context);
    // dialog.style(message: 'Please wait...');
    // await dialog.show();
    // var response = await StripeService.payWithNewCard(
    //     currency: 'USD', amount: amount.toString());
    // await dialog.hide();
    // print('response : ${response.message}');
    // Scaffold.of(context).showSnackBar(SnackBar(
    //   content: Text(response.message),
    //   duration: Duration(milliseconds: response.success == true ? 1200 : 3000),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final orderProvider = Provider.of<OrdersProvider>(context);
    // final cartProvider = Provider.of<CartProvider>(context);
    bool isOrder = true;
    return FutureBuilder(
        future: orderProvider.fetchOrders(),
        builder: (context, snapshot) {
          return orderProvider.getOrders.isEmpty
              ? Scaffold(body: OrderEmpty())
              : Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorsConsts.favColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    backgroundColor: Theme.of(context).backgroundColor,
                    title: Text(
                      'Orders (${orderProvider.getOrders.length})',
                      style: TextStyle(color: ColorsConsts.favColor),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          // globalMethods.showDialogg(
                          //     'Clear cart!',
                          //     'Your cart will be cleared!',
                          //     () => cartProvider.clearCart(),
                          //     context);
                        },
                        icon: Icon(AppIcons.trash),
                      )
                    ],
                  ),
                  body: Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: ListView.builder(
                        itemCount: orderProvider.getOrders.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return ChangeNotifierProvider.value(
                              value: orderProvider.getOrders[index],
                              child: OrderFull());
                        }),
                  ));
        });
  }
}
