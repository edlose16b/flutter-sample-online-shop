import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';

class ProductItemWidget extends StatefulWidget {
  @override
  _ProductItemWidgetState createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int imageRandonID = Random().nextInt(500);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: 210, maxHeight: 240, maxWidth: 140),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: Color(0xffD4D4D4),
              ),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                child: _imageProduct(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 3),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 40, minHeight: 20),
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Soy una figura',
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 35,
                    //   child: Center(
                    //     child: Container(
                    //       width: double.infinity,
                    //       child: Text(
                    //         widget.product.name,
                    //         maxLines: 2,
                    //         textAlign: TextAlign.left,
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 12,
                    //           color: Color(0xff3a3a3a),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 0),
                    _toolsCart(),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageProduct() {
    return Stack(
      children: <Widget>[
        Container(
          height: 148,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            image: DecorationImage(
                image: NetworkImage(
                    'https://www.peru-retail.com/wp-content/uploads/Chizza-Peru.png'),
                fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Row(
              children: <Widget>[
                _showThisProductItemsInCartIfCan(),
                Spacer(),
                _widgetAddToCarIsNotAdmin()
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _widgetAddToCarIsNotAdmin() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(15),
          )),
      child: Center(
        child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      ),
    );
  }

  Widget _showThisProductItemsInCartIfCan() {
    return Container(
      margin: EdgeInsets.only(top: 6, left: 6),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor, shape: BoxShape.circle),
      child: Center(
          child: new Text(
        '4',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      )),
    );
  }

  Widget _toolsCart() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
              child: Container(
            width: 25,
            height: 25,
            child: Center(
              child: Icon(
                Icons.add,
                size: 12,
              ),
            ),
          )),
          Text("S/. 32.10",
              style: TextStyle(
                fontSize: 16,
              )),
          InkWell(
              child: Container(
            width: 25,
            height: 25,
            child: Center(
              child: Icon(
                Icons.remove,
                size: 12,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
