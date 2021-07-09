import 'package:e_commerce/screens/cart_page.dart';
import 'package:e_commerce/screens/feeds_page.dart';
import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/search_page.dart';
import 'package:e_commerce/screens/user_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce/constants/theme_data.dart';
import 'package:e_commerce/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'widget/bottom_bar.dart';

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
          )
        ],
        child: Consumer<DarkThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              routes: {
                HomeScreen.routeName: (context) => HomeScreen(),
                CartScreen.routeName: (context) => CartScreen(),
                FeedsScreen.routeName: (context) => FeedsScreen(),
                UserScreen.routeName: (context) => UserScreen(),
                SearchScreen.routeName: (context) => SearchScreen(),
              },
              title: 'Bottom Navigation bar',
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: BottomBarScreen(),
            );
          },
        ));
  }
}
