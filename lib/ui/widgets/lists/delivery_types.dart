import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onlineshop/constants.dart';

class DeliveryTypesVerticalWidget extends StatelessWidget {
  List<String> values = List();
  List<String> allowedTypes;
  int maxSelecteds;
  Function(String) callback;

  DeliveryTypesVerticalWidget({
    Key key,
    @required this.allowedTypes,
    this.values,
    this.callback,
    this.maxSelecteds = 1,
  }) : super(key: key);

  String valueCart;
  @override
  Widget build(BuildContext context) {
    //print('[[[]] Valores ]]]]]]]] ');
    //print(this.values);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // deliveryacolor

        showContentIfIsAllowed(
          'Delivery',
          'delivery',
          'https://www.flaticon.es/svg/static/icons/svg/738/738000.svg',
          'Cuando el producto o servicio se brinda en casa del cliente',
        ),
        showContentIfIsAllowed(
          'En local',
          'local',
          'https://www.flaticon.es/svg/static/icons/svg/609/609752.svg',
          'Cuando el producto o servicio se brinda en el local',
        )
      ],
    );
  }

  void onTapType(String val) {
    // this.values.add(val);
    this.callback(val);
  }

  Widget showContentIfIsAllowed(
      String name, String value, String icon, String info,
      {String redInfo = ""}) {
    if (!this.allowedTypes.contains(value)) return SizedBox.shrink();

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      //  height: 70,
      child: ListTile(
        onTap: this.callback != null ? () => onTapType(value) : null,
        leading: SvgPicture.network(
          icon,
          width: 25,
          height: 25,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xff3a3a3a),
              ),
            ),
            SizedBox(height: 5),
            Text(
              info,
              style: TextStyle(color: Color(0xffAAAAAA), fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
