import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onlineshop/ui/widgets/lists/delivery_types.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoTab extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final ValueChanged<double> notify;

  InfoTab({Key key, @required this.notify}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((d) {
      var mContext = widgetKey.currentContext;
      print('Tamaño en Informacion' + mContext?.size.toString());
      if (mContext != null) {
        notify(mContext.size.height);
      }
    });

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        key: widgetKey,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _sectionDataShop(context),
            SizedBox(height: 20),
            _sectionDeliveryTypes(context),
            SizedBox(height: 20),
            _sectionPayments(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget _sectionDeliveryTypes(context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Formas de entrega",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xff3a3a3a),
          ),
        ),
        SizedBox(
          height: 20,
          width: double.infinity,
        ),
        DeliveryTypesVerticalWidget(
          allowedTypes: ['delivery', 'local'],
        ),
      ],
    ),
  );
}

Widget _sectionDataShop(context) {
  Widget sectionDatos() {
    return _sectionAndContext(
        'Dirección',
        'assets/icons/mapa.svg',
        InkWell(
          onTap: () {
            double lat = 12.21;
            double lng = 32.12;
            launch('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
          },
          child: Text(
            'Av. Imaginación',
            textAlign: TextAlign.left,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
              color: Color(0xff3a3a3a),
            ),
          ),
        ));
  }

  Widget sectionSchedule() {
    Widget dayAndInterval(String day, String startedAt, String finishAt) {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$day :",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff3a3a3a),
              ),
            ),
            Text(
              "$startedAt - $finishAt",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff3a3a3a),
              ),
            )
          ],
        ),
      );
    }

    return _sectionAndContext(
        'Horario de atención',
        'assets/icons/reloj.svg',
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            dayAndInterval(
              'Lunes',
              '08:00 AM',
              '06:00 PM',
            ),
            dayAndInterval(
              'Martes',
              '08:00 AM',
              '06:00 PM',
            ),
            dayAndInterval(
              'Miercoles',
              '08:00 AM',
              '06:00 PM',
            ),
            dayAndInterval(
              'Jueves',
              '08:00 AM',
              '06:00 PM',
            ),
            dayAndInterval(
              'Viernes',
              '08:00 AM',
              '06:00 PM',
            ),
            dayAndInterval(
              'Sábado',
              '08:00 AM',
              '06:00 PM',
            ),
            dayClosed('Domingo'),
          ],
        ));
  }

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        headerTitle("Datos de la tienda", edit: false, onPress: () => null),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
              'Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de borradores de diseño para probar el diseño visual antes de insertar el texto fina.'),
        ),
        sectionDatos(),
        SizedBox(height: 20),
        sectionSchedule(),
      ],
    ),
  );
}

Widget _sectionPayments() {
  //_shopProvider.shop.
  return Padding(
    padding: EdgeInsets.only(top: 10.0),
    child: Column(
      children: <Widget>[
        headerTitle('Medios de pagos aceptados', edit: false),
        ListView.builder(
            padding: EdgeInsets.only(top: 20),
            shrinkWrap: true,
            primary: false,
            physics: ClampingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Container(
                  height: 30.00,
                  width: 30.00,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://tentulogo.com/wp-content/uploads/VISA-CABECERA-POST-BLOG.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(5.00),
                  ),
                ),
                title: Text(
                  'Visa',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff5a5d53),
                  ),
                ),
              );
            }),
      ],
    ),
  );
}

Widget _sectionAndContext(String text, String icon, Widget widget) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          SvgPicture.asset(
            icon,
            width: 15,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff3a3a3a),
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: widget,
      )
    ],
  );
}

Widget headerTitle(String title, {bool edit = true, Function onPress}) {
  Widget btnEdit() {
    return FlatButton(
      color: Color(0xffEEEEEE),
      onPressed: () => onPress == null ? null : onPress(),
      child: Row(
        children: <Widget>[
          Text(
            "Editar ",
            style: TextStyle(
              fontSize: 11,
              color: Color(0xff3a3a3a),
            ),
          ),
          SizedBox(width: 4),
          Icon(Icons.edit, size: 11),
        ],
      ),
    );
  }

  return Row(
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Color(0xff3a3a3a),
        ),
      ),
      Spacer(),
      edit ? btnEdit() : SizedBox.shrink(),
    ],
  );
}

Widget dayClosed(String day) {
  return Container(
    padding: EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$day :",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff3a3a3a),
          ),
        ),
        Text(
          "Cerrado",
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
          ),
        )
      ],
    ),
  );
}
