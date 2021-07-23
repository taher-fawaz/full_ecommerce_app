import 'package:e_commerce/Controller/provider/cart_provider.dart';
import 'package:e_commerce/Controller/provider/dark_theme_provider.dart';
import 'package:e_commerce/Model/cart_attr.dart';
import 'package:e_commerce/View/prooduct/product_details.dart';
import 'package:e_commerce/widget/dialogs/material_dialogs.dart';
import 'package:e_commerce/widget/dialogs/widgets/buttons/icon_button.dart';
import 'package:e_commerce/widget/dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_commerce/Controller/constants/colors.dart';
import 'package:e_commerce/Controller/constants/my_icons.dart';
import 'package:provider/provider.dart';

class CartProductCard extends StatefulWidget {
  late String? productId;

  CartProductCard({this.productId});
  @override
  _CartProductCardState createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    final cartAttr = Provider.of<CartAttr>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    double subTotal = cartAttr.price! * cartAttr.quantity!;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
          arguments: widget.productId),
      child: Container(
        height: 135,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
          ),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cartAttr.imageUrl!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            cartAttr.title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(32.0),
                            // splashColor: ,
                            onTap: () {
                              _showDialog(() {
                                cartProvider.removeCardItem(widget.productId!);
                                Navigator.pop(context);
                              }, 'Are you sure? you can\'t undo this action',
                                  "Remove Item!");
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              child: FaIcon(
                                AppIcons.cross,
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Price:'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${cartAttr.price!} \$',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Sub Total:'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${subTotal.toStringAsFixed(2)} \$',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: themeChange.darkTheme
                                  ? Colors.brown.shade900
                                  : Theme.of(context).accentColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Ships Free',
                          style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.brown.shade900
                                  : Theme.of(context).accentColor),
                        ),
                        Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            // splashColor: ,
                            onTap: () {
                              cartProvider.reduceItemByOne(
                                  widget.productId!,
                                  cartAttr.price!,
                                  cartAttr.title!,
                                  cartAttr.imageUrl!,
                                  cartAttr.quantity);
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FaIcon(
                                  AppIcons.minus,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 12,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            padding: const EdgeInsets.all(8.0),
                            decoration: backgroundDecoration(0),
                            child: Text(
                              cartAttr.quantity!.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            // splashColor: ,
                            onTap: () {
                              cartProvider.addProductToCart(
                                  widget.productId!,
                                  cartAttr.price!,
                                  cartAttr.title!,
                                  cartAttr.imageUrl!);
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FaIcon(
                                  AppIcons.plus,
                                  color: Colors.green,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //   // padding:
                    //   //     EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    //   width: 100,
                    //   height: 100,
                    //   child: StepperTouch(
                    //     buttonsColor: Colors.blue,
                    //     counterColor: Colors.green,
                    //     dragButtonColor: Colors.black,
                    //     initialValue: 0,
                    //     direction: Axis.horizontal,
                    //     withSpring: false,
                    //     onChanged: (int value) => print('new value $value'),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(onPressed, String msg, String title) {
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
