import 'package:flutter/material.dart';
import 'package:onlineshop/ui/screens/shop/profile/profile.dart';
import 'package:onlineshop/ui/widgets/local.item.dart';
import 'package:onlineshop/ui/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {},
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            child: Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Buenos días\nPedro !",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xff3a3a3a),
              ),
            ),
            SizedBox(height: 20),
            SearchWidget(),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "Locales",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color(0xff3a3a3a),
                  ),
                ),
                Spacer(),
                Text(
                  "Ver en el mapa",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xffbebebe),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 11,
                  color: Color(0xffbebebe),
                )
              ],
            ),
            SizedBox(height: 30),
            InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, ShopProfileScreen.routeName),
                child: LocalItemWidget()),
            SizedBox(height: 30),
            LocalItemWidget(),
            SizedBox(height: 30),
            LocalItemWidget(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
