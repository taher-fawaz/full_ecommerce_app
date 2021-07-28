import 'package:e_commerce/View/Feeds/components/categories_feeds.dart';
import 'package:e_commerce/View/Cart/cart_page.dart';
import 'package:e_commerce/View/Feeds/feeds_page.dart';
import 'package:e_commerce/View/Home/components/upload_product_form.dart';
import 'package:e_commerce/View/Home/home_page.dart';
import 'package:e_commerce/View/Login/login.dart';
import 'package:e_commerce/View/Search/search_page.dart';
import 'package:e_commerce/View/User/user_page.dart';
import 'package:e_commerce/View/Wishlist/wishlist_page.dart';
import 'package:e_commerce/View/landing/landing_page.dart';
import 'package:e_commerce/View/signUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/Controller/constants/theme_data.dart';
import 'package:provider/provider.dart';

import 'Controller/provider/cart_provider.dart';
import 'Controller/provider/dark_theme_provider.dart';
import 'Controller/provider/favs_provider.dart';
import 'Controller/provider/products.dart';
import 'View/Brands/brands_navigation_rail.dart';
import 'View/prooduct/product_details.dart';

import 'View/BottomBar/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) {
              return themeChangeProvider;
            },
          ),
          ChangeNotifierProvider(
            create: (_) => Products(),
          ),
          ChangeNotifierProvider(
            create: (_) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavsProvider(),
          ),
        ],
        child: Consumer<DarkThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  HomeScreen.routeName: (context) => HomeScreen(),
                  CartScreen.routeName: (context) => CartScreen(),
                  FeedsScreen.routeName: (context) => FeedsScreen(),
                  UserScreen.routeName: (context) => UserScreen(),
                  SearchScreen.routeName: (context) => SearchScreen(),
                  WishListScreen.routeName: (context) => WishListScreen(),
                  BrandNavigationRailScreen.routeName: (context) =>
                      BrandNavigationRailScreen(),
                  ProductDetails.routeName: (context) => ProductDetails(),
                  CategoriesFeedsScreen.routeName: (context) =>
                      CategoriesFeedsScreen(),
                  LoginScreen.routeName: (context) => LoginScreen(),
                  SignUpScreen.routeName: (context) => SignUpScreen(),
                  BottomBarScreen.routeName: (context) => BottomBarScreen(),
                  UploadProductForm.routeName: (context) => UploadProductForm(),
                },
                title: 'Bottom Navigation bar',
                theme: Styles.themeData(themeChangeProvider.darkTheme, context),
                home: LandingPage()
                //BottomBarScreen(),
                );
          },
        ));
  }
}
