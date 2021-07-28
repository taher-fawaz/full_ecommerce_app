import 'package:e_commerce/View/BottomBar/bottom_bar.dart';
import 'package:e_commerce/View/Home/components/upload_product_form.dart';
import 'package:flutter/material.dart';

class MainScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBarScreen(), UploadProductForm()],
    );
  }
}
