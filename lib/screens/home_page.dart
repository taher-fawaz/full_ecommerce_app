import 'package:backdrop/backdrop.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/screens/user_page.dart';
import 'package:e_commerce/widget/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _progressController = true;
  late String _imageUrl;

  @override
  void initState() {
    super.initState();
  }

  List<String> _images = [
    'assets/images/carousel7.jpg',
    'assets/images/carousel5.jpg',
    'assets/images/carousel6.jpg',
    'assets/images/carousel8.jpg',
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel4.png',
  ];
  List<Widget> _items = [
    Image.asset('assets/images/product2.png'),
    Image.asset('assets/images/product2.png'),
    Image.asset('assets/images/product2.png'),

    //   AssetImage(_images[4]),
    //ExactAssetImage("assets/images/emptycart.png")
  ];
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      headerHeight: MediaQuery.of(context).size.height * 0.15,
      appBar: BackdropAppBar(
        leading: BackdropToggleButton(
          icon: AnimatedIcons.home_menu,
          color: Colors.white,
        ),

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  ColorsConsts.starterColor,
                  //Colors.amber.shade200,
                  ColorsConsts.endColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        elevation: 0,

        title: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black87,
          ),
        ), //▲
        actions: <Widget>[
          IconButton(
            iconSize: 10,
            padding: EdgeInsets.all(0),
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 13,
                // backgroundImage: _imageUrl == null
                //     ? AssetImage('assets/images/emptycart.png')
                //     : NetworkImage(_imageUrl),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserScreen(),
                ),
              );
            },
          ),
        ],
      ),
      backLayer: Text('hadi'),
      frontLayer: Scaffold(
        // backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                // margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 190,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 800,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: _items,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 10, right: 10, bottom: 15),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CategoryItemWidget(
                      index,
                    );
                  },
                ),
              ),
              SizedBox(height: 3),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 210,
                    width: MediaQuery.of(context).size.width * 0.95,
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              color: Colors.blueGrey,
                              child: Image.asset(
                                'assets/images/empty_cart.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                        autoplay: true,
                        itemCount: 7,
                        viewportFraction: 0.8,
                        scale: 0.9,
                        onTap: (index) {}),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 15),
                    child: Text(
                      'Popular Products',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                  FlatButton(
                    // color: Colors.blue,
                    //  textColor: Colors.white,
                    padding: const EdgeInsets.only(left: 20, right: 17),
                    splashColor: Colors.grey,
                    onPressed: () {},
                    child: Text(
                      "View all >>",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),

              // //  Container(
              // //     width: double.infinity,
              // //     height: 285,
              // //     margin: EdgeInsets.only(right: 3, left: 3),
              // //     child: ListView.builder(
              // //       scrollDirection: Axis.horizontal,
              // //       itemCount: popularProduct.length,
              // //       itemBuilder: (BuildContext context, int index) {
              // //         if (!popularProduct[index].isPopular)
              // //           return Container(
              // //             width: 0,
              // //             height: 0,
              // //           );
              // //         if (popularProduct[index].isPopular) {
              // //           return ChangeNotifierProvider.value(
              // //             value: products.popularItems[index],
              // //             child: PopularProducts(

              // //                 ),
              // //           );
              // //         }
              // //       },
              // //     ),
              // //   ),
            ],
          ),
        ),
      ),
    );
  }
}
