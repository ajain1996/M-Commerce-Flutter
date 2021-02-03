import 'package:Gauth/screens/HomePage.dart';
import 'package:Gauth/screens/add_product.dart';
import 'package:Gauth/screens/display_products.dart';
import 'package:Gauth/tabs/CartPage.dart';
import 'package:Gauth/tabs/ExploreTab.dart';
import 'package:Gauth/tabs/MoviesPage.dart';
import 'package:Gauth/tabs/ProfilePage.dart';
import 'package:Gauth/tabs/SavedPage.dart';
import 'package:Gauth/tabs/bottom_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  PageController _tabsPagesController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPagesController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: PageView(
            controller: _tabsPagesController,
            onPageChanged: (num) {
              setState(() {
                _selectedTab = num;
              });
            },
            children: [
              HomePage(),
              DisplayProducts(),
              AddProduct(),
              SavedPage(),
              MoviesPage(),
            ],
          ),
        ),
        BottomTabs(
          selectedTab: _selectedTab,
          tabPressed: (num) {
            _tabsPagesController.animateToPage(
              num,
              duration: Duration(microseconds: 300),
              curve: Curves.easeInCubic,
            );
          },
        )
      ],
    ));
  }
}

// onPressed: () {
//   FirebaseAuth.instance.signOut();
// },
