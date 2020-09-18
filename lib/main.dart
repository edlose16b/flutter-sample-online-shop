import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlineshop/constants.dart';
import 'package:onlineshop/router.dart';
import 'package:onlineshop/ui/screens/home/home.dart';
import 'package:onlineshop/ui/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      title: kCompanyName,
      theme: primaryTheme,
      onGenerateRoute: generateRoute,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
