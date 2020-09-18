import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:onlineshop/ui/widgets/comment/comment.dart';

class CommentsTab extends StatefulWidget {
  CommentsTab({Key key, this.scrollPhysics}) : super(key: key);
  ScrollPhysics scrollPhysics;

  @override
  _CommentsTabState createState() => _CommentsTabState();
}

class _CommentsTabState extends State<CommentsTab> {
  final GlobalKey widgetKey = GlobalKey();

  int totalItems = 25;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((d) {
      var mContext = widgetKey.currentContext;
      print('Tamaño en Informacion' + mContext?.size.toString());
    });

    return NotificationListener(
      onNotification: (notificationInfo) {
        if (notificationInfo is ScrollStartNotification) {
          if (_scrollController.offset == 0) {
            print(
                '🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶🦶 ON reach top from ScrollStartNotification');
            setState(() {
              widget.scrollPhysics = null;
            });
          }
        }
        return true;
      },
      child: Container(
        key: widgetKey,
        margin: EdgeInsets.only(top: 20),
        child: ListView.separated(
          controller: _scrollController,
          physics: widget.scrollPhysics ?? NeverScrollableScrollPhysics(),
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
