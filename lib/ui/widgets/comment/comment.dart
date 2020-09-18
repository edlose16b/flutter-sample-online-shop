import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onlineshop/ui/widgets/comment/stars.dart';

class CommentWidget extends StatelessWidget {
  final String text;

  const CommentWidget({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pm1.narvii.com/7531/b1c1749b42f91f7e2d2de4e02d124f67476f9b31r1-1080-1080v2_hq.jpg'),
              )),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ryujin " + this.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color(0xff3a3a3a),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: FillStarsWidget(
                      filleds: Random().nextInt(5),
                    ),
                  ),
                  Container(
                      width: 300,
                      child: Text(
                        'Muy buen servicio',
                        maxLines: 5,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff707070),
                        ),
                      )),
                  SizedBox(height: 5),
                  Text(
                    '1 hour ago',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffd4d4d4),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
