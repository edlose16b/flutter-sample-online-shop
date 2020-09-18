import 'package:flutter/material.dart';
import 'package:onlineshop/ui/screens/shop/profile/tabs/comments.dart';
import 'package:onlineshop/ui/screens/shop/profile/tabs/info.dart';
import 'package:onlineshop/ui/screens/shop/profile/tabs/menu.dart';
import 'package:onlineshop/ui/widgets/local_info.dart';

class ShopProfileContent extends StatefulWidget {
  ShopProfileContent({Key key, @required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;

  @override
  _ShopProfileContentState createState() => _ShopProfileContentState();
}

class _ShopProfileContentState extends State<ShopProfileContent>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  double currentHeight, heightMenu, heightComments, heightInfo;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);

    _tabController.addListener(() {
      print('Tab Controller');
      print(_tabController.index);
      calculateHeightContent();
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print('[WidgetsBinding]');
      calculateHeightContent();
    });


  }

  void calculateHeightContent() {
    double contextHeight = MediaQuery.of(context).size.height;
    print('heightMenu $currentHeight');
    print('index -> ' + _tabController?.index.toString());
    print('heightMenu $heightMenu');
    print('heightMenu $heightComments');
    print('heightMenu $heightInfo');

    if (_tabController.index == 0 && heightMenu != null) {
      setState(() {
        currentHeight = heightMenu + 310;
      });
      return;
    }
    if (_tabController.index == 1 && heightComments != null) {
      setState(() {
        currentHeight = heightComments + 310;
      });
      return;
    }
    if (_tabController.index == 2 && heightInfo != null) {
      setState(() {
        currentHeight = heightInfo + 310;
      });
      return;
    }

    setState(() {
      currentHeight = contextHeight * 1.5;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        controller: widget.scrollController,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: LocalInfoWidget(
                    titleSize: 20,
                    addressSize: 16,
                  ),
                ),
                SizedBox(height: 25),
                tabHeader(),
                Container(
                  child: Container(
                    width: double.infinity,
                    //TODO : Recognize the height of each tab
                    height:
                        currentHeight ?? MediaQuery.of(context).size.height * 2,
                    // color: Colors.purpleAccent.withOpacity(0.2),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        MenuTab(
                          notify: (val) {
                            print('Valor que en MENUTAB es ' + val.toString());

                            heightMenu = val;
                            // calculateHeightContent();
                          },
                        ),
                        CommentsTab(
                          notify: (val) {
                            print('Valor que viene CommentsTab es ' +
                                val.toString());

                            heightComments = val;
                          },
                        ),
                        InfoTab(
                          notify: (val) {
                            print(
                                'Valor que viene InfoTab es ' + val.toString());

                            heightInfo = val;
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabHeader() {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(color: Color(0xffF5F5F5), width: 1),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            text: 'Carta',
          ),
          Tab(
            text: 'Comentarios',
          ),
          Tab(
            text: 'Información',
          ),
        ],
      ),
    );
  }
}
