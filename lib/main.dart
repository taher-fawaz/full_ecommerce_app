import 'package:e_commerce/Controller/provider/orders_provider.dart';
import 'package:e_commerce/View/Feeds/components/categories_feeds.dart';
import 'package:e_commerce/View/Cart/cart_page.dart';
import 'package:e_commerce/View/Feeds/feeds_page.dart';
import 'package:e_commerce/View/upload/upload_product_form.dart';
import 'package:e_commerce/View/Home/home_page.dart';
import 'package:e_commerce/View/Login/login.dart';
import 'package:e_commerce/View/Main/main_screen.dart';
import 'package:e_commerce/View/Main/user_state.dart';
import 'package:e_commerce/View/Search/search_page.dart';
import 'package:e_commerce/View/User/user_page.dart';
import 'package:e_commerce/View/Wishlist/wishlist_page.dart';
import 'package:e_commerce/View/landing/landing_page.dart';
import 'package:e_commerce/View/signUp/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/Controller/constants/theme_data.dart';
import 'package:provider/provider.dart';

import 'Controller/provider/cart_provider.dart';
import 'Controller/provider/dark_theme_provider.dart';
import 'Controller/provider/favs_provider.dart';
import 'Controller/provider/products.dart';
import 'View/Brands/brands_navigation_rail.dart';
import 'View/orders/order.dart';
import 'View/prooduct/product_details.dart';

import 'View/BottomBar/bottom_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Error occured'),
                ),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return themeChangeProvider;
              }),
              ChangeNotifierProvider(
                create: (_) => Products(),
              ),
              ChangeNotifierProvider(
                create: (_) => CartProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => FavsProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => OrdersProvider(),
              ),
            ],
            child: Consumer<DarkThemeProvider>(
              builder: (context, themeChangeProvider, ch) {
                return MaterialApp(
                  title: 'Flutter Shop',
                  theme:
                      Styles.themeData(themeChangeProvider.darkTheme, context),
                  home: UserState(),
                  //initialRoute: '/',
                  routes: {
                    //   '/': (ctx) => LandingPage(),
                    BrandNavigationRailScreen.routeName: (ctx) =>
                        BrandNavigationRailScreen(),
                    CartScreen.routeName: (ctx) => CartScreen(),
                    FeedsScreen.routeName: (ctx) => FeedsScreen(),
                    WishListScreen.routeName: (ctx) => WishListScreen(),
                    ProductDetails.routeName: (ctx) => ProductDetails(),
                    CategoriesFeedsScreen.routeName: (ctx) =>
                        CategoriesFeedsScreen(),
                    LoginScreen.routeName: (ctx) => LoginScreen(),
                    SignUpScreen.routeName: (ctx) => SignUpScreen(),
                    BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
                    UploadProductForm.routeName: (ctx) => UploadProductForm(),
                    // ForgetPassword.routeName: (ctx) => ForgetPassword(),
                    OrderScreen.routeName: (ctx) => OrderScreen(),
                  },
                );
              },
            ),
          );
        });
  }
}
