import 'package:flutter/material.dart';
import 'package:onlineshop/ui/screens/shop/profile/tabs/comments.dart';
import 'package:onlineshop/ui/screens/shop/profile/tabs/info.dart';
import 'package:onlineshop/ui/screens/shop/profile/tabs/menu.dart';
import 'package:onlineshop/ui/widgets/local_info.dart';
import 'package:rubber/rubber.dart';

class ShopProfileContent extends StatefulWidget {
  ShopProfileContent({
    Key key,
    @required this.scrollController,
    @required this.rubberAnimationController,
  }) : super(key: key);
  final ScrollController scrollController;
  final RubberAnimationController rubberAnimationController;

  @override
  _ShopProfileContentState createState() => _ShopProfileContentState();
}

class _ShopProfileContentState extends State<ShopProfileContent>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollPhysics scrollPhysics;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);

    _tabController.addListener(() {
      print(_tabController.index);
    });

    widget.rubberAnimationController.animationState.addListener(() {
      // if (widget.rubberAnimationController.animationState.value ==
      //     AnimationState.collapsed) {
      //   setState(() {
      //     scrollPhysics = NeverScrollableScrollPhysics();
      //   });
      //   return;
      // }
      if (widget.rubberAnimationController.animationState.value ==
          AnimationState.expanded) {
        setState(() {
          scrollPhysics = AlwaysScrollableScrollPhysics();
        });

        return;
      }
    });

    // widget.scrollController.addListener(() {
    //   if (widget.scrollController.offset >=
    //           widget.scrollController.position.maxScrollExtent &&
    //       !widget.scrollController.position.outOfRange) {
    //     print("🤬🤬🤬🤬🤬 reach the bottom");
    //     setState(() {
    //       scrollPhysics = AlwaysScrollableScrollPhysics();
    //     });
    //   }
    // });

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   print('[WidgetsBinding]');
    // });
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
                    height: MediaQuery.of(context).size.height * 2,
                    // color: Colors.purpleAccent.withOpacity(0.2),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        MenuTab(
                          scrollPhysics: scrollPhysics,
                          onReachTop: () {
                            // setState(() {
                            //   scrollPhysics = NeverScrollableScrollPhysics();
                            // });
                            // widget.rubberAnimationController.collapse();
                          },
                        ),
                        CommentsTab(
                          scrollPhysics: scrollPhysics,
                        ),
                        InfoTab(
                          scrollPhysics: scrollPhysics,
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
