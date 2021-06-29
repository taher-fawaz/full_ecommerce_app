import 'package:flutter/material.dart';
import 'package:market/constants/my_icons.dart';
import 'package:market/screens/feeds_page.dart';
import 'package:market/screens/home_page.dart';

import 'screens/cart_page.dart';
import 'screens/search_page.dart';
import 'screens/user_page.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  // List _pages = [
  //   HomeScreen(),
  //   FeedsScreen(),
  //   SearchScreen(),
  //   CartScreen(),
  //   UserScreen(),
  // ];

  late List<Map<String, dynamic>> _pages;
  int _selectedIndex = 3;

  @override
  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': 'Home Screen'},
      {'page': FeedsScreen(), 'title': 'Feeds screen'},
      {'page': SearchScreen(), 'title': 'Search Screen'},
      {'page': CartScreen(), 'title': 'CartScreen'},
      {'page': UserScreen(), 'title': 'UserScreen'}
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_selectedIndex]['title']),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3,
        clipBehavior: Clip.antiAlias,
        // elevation: 5,
        shape: CircularNotchedRectangle(),
        child: Container(
          // height: kBottomNavigationBarHeight * 0.8,
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(width: 0.5),
          )),
          child: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).textSelectionColor,
            selectedItemColor: Colors.purple,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: AppIcons.home,
                tooltip: 'Home',
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: AppIcons.feeds,
                tooltip: 'Feeds',
                label: 'Feeds',
              ),
              BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null), // Icon(
                //   Icons.search,
                //   color: Colors.transparent,
                // ),
                tooltip: 'Search',
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: AppIcons.cart,
                tooltip: 'Cart',
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: AppIcons.user,
                tooltip: 'User',
                label: 'User',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        tooltip: 'Search',
        elevation: 5,
        child: (AppIcons.search),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
      ),
    );
  }
}
