import 'package:flutter/material.dart';

class LocalInfoWidget extends StatelessWidget {
  const LocalInfoWidget({Key key, this.titleSize = 16, this.addressSize = 16})
      : super(key: key);
  final double titleSize, addressSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Me Sabe a Perú",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: this.titleSize,
              color: Color(0xff3a3a3a),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.person_pin_circle,
                size: this.addressSize,
                color: Color(0xffbebebe),
              ),
              SizedBox(width: 5),
              Text(
                "Quinta normal 3452. Santiago",
                style: TextStyle(
                  fontSize: this.addressSize,
                  color: Color(0xffbebebe),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 12,
                color: Color(0xffff6070),
              ),
              SizedBox(width: 5),
              Text(
                "4.5",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xffff6070),
                ),
              ),
              SizedBox(width: 5),
              Text(
                "( 23 ). 370 m",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xffbebebe),
                ),
              ),
              Spacer(),
              new Text(
                "abierto",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.green),
              )
            ],
          )
        ],
      ),
    );
  }
}
