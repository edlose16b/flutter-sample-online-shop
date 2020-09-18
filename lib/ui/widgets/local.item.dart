import 'package:flutter/material.dart';
import 'package:onlineshop/ui/widgets/local_info.dart';

class LocalItemWidget extends StatelessWidget {
  const LocalItemWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minHeight: 270),
        child: Container(
          width: double.infinity,
          height: 280,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                )
              ]),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.peru-retail.com/wp-content/uploads/kfc-grifo-Kio-peru.jpg'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: LocalInfoWidget(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
