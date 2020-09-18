import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FillStarsWidget extends StatefulWidget {
  final int filleds;
  final int total;

  FillStarsWidget({Key key, @required this.filleds, this.total = 5})
      : super(key: key);

  @override
  _FillStarsWidgetState createState() => _FillStarsWidgetState();
}

class _FillStarsWidgetState extends State<FillStarsWidget> {
  List<Widget> _fill() {
    List<Widget> l = List();

    for (var i = 1; i <= this.widget.total; i++) {
      l.add(_iconStar(i <= widget.filleds
          ? Theme.of(context).primaryColorDark
          : Colors.grey));
    }

    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: _fill()),
    );
  }

  Widget _iconStar(Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1),
      child: Icon(
        Icons.star,
        size: 12,
        color: color,
      ),
    );
  }
}
