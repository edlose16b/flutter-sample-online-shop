import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:onlineshop/ui/widgets/lists/categories_with_products.dart';

class MenuTab extends StatefulWidget {
  MenuTab({Key key, @required this.scrollPhysics, @required this.onReachTop});

  ScrollPhysics scrollPhysics;
  Function onReachTop;

  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  int totalItems = 20;

  ScrollController _scrollController = ScrollController();

  _MenuTabState() {
    WidgetsBinding.instance.addPostFrameCallback((d) {
      // _scrollController.removeListener(() {});

      // _scrollController.addListener(() {
      //   if (_scrollController.offset <=
      //           _scrollController.position.minScrollExtent &&
      //       !_scrollController.position.outOfRange) {
      //     // this.onReachTop();
      //   }
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        physics: widget.scrollPhysics ?? NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 20, bottom: 30),
        itemBuilder: (_, i) {
          return ListCategoriesWithProducts();
        },
        itemCount: totalItems,
      ),
      onNotification: (notificationInfo) {
        if (notificationInfo is ScrollStartNotification) {
          if (_scrollController.offset == 0) {
            print(
                '🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶 ON reach top from ScrollStartNotification');
            setState(() {
              widget.scrollPhysics = null;
            });
            this.widget.onReachTop();
          }
          // print("scroll");
          // print("detail:" + notificationInfo.dragDetails.toString());

          // /// your code
          // print(_scrollController.offset);
        }
        return true;
      },
    );
  }
}
