import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:onlineshop/ui/widgets/lists/categories_with_products.dart';

class MenuTab extends StatelessWidget {
  final widgetKey = GlobalKey();
  final ValueChanged<double> notify;

  MenuTab({Key key, @required this.notify}) : super(key: key);

  int totalItems = 10;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((d) {
      var mContext = widgetKey.currentContext;
      print('Tamaño en Informacion ' + mContext?.size.toString());
      print('tamaño con items ' + (totalItems * 280.0).toString());
      if (mContext != null) {
        // notify(mContext.size.height);
        notify(totalItems * 280.0);
      }
    });

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        key: widgetKey,
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 20, bottom: 30),
          itemBuilder: (_, i) {
            return ListCategoriesWithProducts();
          },
          itemCount: totalItems,
        ),
      ),
    );
  }
}
