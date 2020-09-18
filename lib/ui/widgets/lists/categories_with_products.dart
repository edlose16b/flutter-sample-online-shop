import 'package:flutter/material.dart';
import 'package:onlineshop/ui/widgets/product.item.dart';

class ListCategoriesWithProducts extends StatefulWidget {
  ListCategoriesWithProducts();

  @override
  _ListCategoriesWithProductsState createState() =>
      _ListCategoriesWithProductsState();
}

class _ListCategoriesWithProductsState
    extends State<ListCategoriesWithProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      _titleCategory(context),
      _listHorizontalProducts(),
    ]);
  }

  Widget _listHorizontalProducts() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 270, minHeight: 56.0),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ProductItemWidget(),
          );
        },
        itemCount: 5,
      ),
    );
  }

  Widget _titleCategory(context) {
    return Row(children: <Widget>[
      Expanded(
        flex: 8,
        child: Container(
          padding: EdgeInsets.only(left: 10),
          child: Text('widget.category.name',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Color(0xff3a3a3a))),
        ),
      ),
      Expanded(
        flex: 3,
        child: Container(
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Ver más', style: TextStyle(color: Color(0xffbbcccd))),
                Icon(Icons.chevron_right),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
