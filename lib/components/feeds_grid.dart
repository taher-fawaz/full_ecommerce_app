import 'package:e_commerce/constants/constants_values.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/provider/products.dart';
import 'package:e_commerce/widget/feeds_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class FeedsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    List<Product> productsList = productsProvider.products;
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: feedsItemWidth / feedsItemHeight,
      crossAxisSpacing: 18,
      mainAxisSpacing: 58,
      children: List.generate(productsList.length, (index) {
        return ChangeNotifierProvider.value(
          value: productsList[index],
          child: FeedsProductItem(),
        );
      }),
    )
        //     StaggeredGridView.countBuilder(
        //   // padding: ,
        //   crossAxisCount: 6,
        //   itemCount: 8,
        //   itemBuilder: (BuildContext context, int index) => FeedsProductItem(),
        //   staggeredTileBuilder: (int index) =>
        //       new StaggeredTile.count(3, index.isEven ? 4 : 5),
        //   mainAxisSpacing: 8.0,
        //   crossAxisSpacing: 6.0,
        // ),
        );
  }
}
