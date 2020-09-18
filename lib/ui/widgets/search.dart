import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.00,
      // margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.00,
          color: Color(0xffeeeeee),
        ),
        borderRadius: BorderRadius.circular(10.00),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.00),
        child: InkWell(
          onTap: () => null,
          splashColor: Colors.grey.withOpacity(0.2),
          highlightColor: Colors.transparent,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              Icon(Icons.search),
              SizedBox(width: 10),
              Text(
                'Buscar',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffd4d4d4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
