import 'package:flutter/material.dart';
import 'package:onlineshop/ui/screens/home/home.dart';
import 'package:onlineshop/ui/screens/shop/profile/profile.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case ShopProfileScreen.routeName:
      return MaterialPageRoute(builder: (context) => ShopProfileScreen());
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
