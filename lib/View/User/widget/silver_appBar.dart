import 'package:e_commerce/Controller/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomizeAppBar extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  const CustomizeAppBar({Key? key, this.imageUrl, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double top = 0.0;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 4,
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        top = constraints.biggest.height;
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  ColorsConsts.starterColor,
                  ColorsConsts.endColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            centerTitle: true,
            title: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: top <= 110.0 ? 1.0 : 0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: kToolbarHeight / 1.8,
                        width: kToolbarHeight / 1.8,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 1.0,
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(imageUrl!)),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        // 'top.toString()',
                        name!,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            background: Image(
              image: NetworkImage(imageUrl!),
              fit: BoxFit.fill,
            ),
          ),
        );
      }),
    );
  }
}
