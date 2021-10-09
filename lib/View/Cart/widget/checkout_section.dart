import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Controller/constants/colors.dart';
import 'package:e_commerce/Controller/provider/cart_provider.dart';
import 'package:e_commerce/Controller/services/global_method.dart';
import 'package:e_commerce/Controller/services/payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:uuid/uuid.dart';

class CheckOutSection extends StatelessWidget {
  var response;

  double totalAmount = 0.0;
  final double? subtotal;
  CheckOutSection(
    this.totalAmount,
    this.subtotal,
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalMethods _globalMethods = GlobalMethods();

  @override
  Widget build(BuildContext context) {
    Future<void> payWithCard({int? amount}) async {
      ProgressDialog dialog = ProgressDialog(context: context);
      // dialog.style(message: 'Please wait...');
      await dialog.show(max: 1, msg: 'Please wait...');
      response = await StripeService.payWithNewCard(
          currency: 'USD', amount: amount.toString());
      dialog.close();
      print('response : ${response.success}');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(response.message),
        duration:
            Duration(milliseconds: response.success == true ? 1200 : 3000),
      ));
    }

    final cartProvider = Provider.of<CartProvider>(context);
    var uuid = Uuid();
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: .5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  decoration: backgroundDecoration(30),
                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        double amountInCents = subtotal! * 1000;
                        int intengerAmount = (amountInCents / 10).ceil();
                        // await payWithCard(amount: intengerAmount);
                        // if (response.success == true) {
                        final String userId = _auth.currentUser!.uid;
                        cartProvider.getCartItems
                            .forEach((key, orderValue) async {
                          final orderId = uuid.v4();
                          try {
                            await FirebaseFirestore.instance
                                .collection('order')
                                .doc(orderId)
                                .set({
                              'orderId': orderId,
                              'userId': userId,
                              'productId': orderValue.productId,
                              'title': orderValue.title,
                              'price': orderValue.price! * orderValue.quantity!,
                              'imageUrl': orderValue.imageUrl,
                              'quantity': orderValue.quantity,
                              'orderDate': Timestamp.now(),
                            });
                          } catch (err) {
                            print('error occured $err');
                          }
                        });
                        // } else {
                        //   _globalMethods.showError(
                        //     context,
                        //     title: 'error occured',
                        //     content: 'Please enter your true information',
                        //   );
                        // }
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Checkout",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textSelectionTheme
                                  .selectionColor),
                        ),
                      ),
                    ),
                  ),
                )),
            Spacer(),
            Text(
              "Total",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textSelectionTheme.selectionColor),
            ),
            Text(
              "US \$ ${totalAmount.toStringAsFixed(2)}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
