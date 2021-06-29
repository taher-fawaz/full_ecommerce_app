import 'package:flutter/material.dart';
import 'package:market/provider/dark_theme_provider.dart';
import 'package:market/widget/button_widget.dart';
import 'package:market/widget/headline_widget.dart';
import 'package:market/widget/subtitle_widget.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/images/empty_cart.png'),
            ),
          ),
        ),
        HeadlineWidget('Your Cart Is Empty', themeChange.darkTheme),
        SizedBox(
          height: size.height * 0.04,
        ),
        SubTitleWidget(
            'Looks Like You didn\'t \n add anything to your cart yet',
            themeChange.darkTheme),
        SizedBox(
          height: size.height * 0.06,
        ),
        Container(
            width: size.width * 0.9,
            height: size.height * 0.06,
            child: ButtonWidget(
                'shop now'.toUpperCase(), Colors.redAccent, () {})),
      ],
    );
  }
}
