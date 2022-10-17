import 'package:flutter/material.dart';
import 'package:interview_project_1/r_cart_page/cart_page.dart';
import 'package:interview_project_1/r_favorites_page/favorites_page.dart';
import 'package:interview_project_1/r_homepage/_widgets/homepage_view.dart';
import 'package:interview_project_1/r_news/news_page.dart';

class NavBarItem {
  final IconData icon;
  final Widget page;
  final String title;

  NavBarItem({
    required this.icon,
    required this.page,
    required this.title,
  });

  static List<NavBarItem> navItemList = [
    NavBarItem(
      icon: Icons.shopify,
      page: const HomepageView(),
      title: 'Homepage',
    ),
    NavBarItem(
      icon: Icons.notifications,
      page: const NewsPage(),
      title: 'News',
    ),
    NavBarItem(
      icon: Icons.favorite,
      page: const FavoritesPage(),
      title: 'Favorites',
    ),
    NavBarItem(
      icon: Icons.shopping_bag_rounded,
      page: const CartPage(),
      title: 'Cart',
    ),
  ];
}
