import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:onlineshop/ui/widgets/comment/comment.dart';

class CommentsTab extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final ValueChanged<double> notify;

  CommentsTab({Key key, @required this.notify}) : super(key: key);

  int totalItems = 25;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((d) {
      var mContext = widgetKey.currentContext;
      print('Tamaño en Informacion' + mContext?.size.toString());
      if (mContext != null) {
        // notify(mContext.size.height);
        notify(totalItems * 100.0);
      }
    });

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        key: widgetKey,
        margin: EdgeInsets.only(top: 20),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          separatorBuilder: (_, __) => SizedBox(height: 10),
          itemBuilder: (_, i) => CommentWidget(text: i.toString()),
          itemCount: totalItems,
        ),
      ),
    );
  }
}
