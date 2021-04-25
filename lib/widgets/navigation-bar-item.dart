import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:haggle_clone/screens/dashboard.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Widget icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: DashboardScreen(),
          icon: Image.asset(
            'assets/images/home.png',
            height: 22,
            width: 22,
          ),
          title: "Home",
        ),
        TabNavigationItem(
          page: DashboardScreen(),
          icon: Image.asset(
            'assets/images/wallet.png',
            height: 22,
            width: 22,
          ),
          title: "Wallet",
        ),
        TabNavigationItem(
          page: DashboardScreen(),
          icon: Image.asset(
            'assets/images/OTC.png',
            height: 50,
            width: 50,
          ),
          title: '',
        ),
        TabNavigationItem(
          page: DashboardScreen(),
          icon: Image.asset(
            'assets/images/crypto.png',
            height: 20,
            width: 20,
          ),
          title: "Cryptosave",
        ),
        TabNavigationItem(
          page: DashboardScreen(),
          icon: Image.asset(
            'assets/images/more.png',
            height: 20,
            width: 20,
          ),
          title: "More",
        ),
      ];
}
