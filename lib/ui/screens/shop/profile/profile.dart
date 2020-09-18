import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:onlineshop/ui/screens/shop/profile/content.dart';
import 'package:onlineshop/ui/screens/shop/profile/tabs/comments.dart';
import 'package:onlineshop/ui/screens/shop/profile/tabs/info.dart';
import 'package:onlineshop/ui/screens/shop/profile/tabs/menu.dart';
import 'package:onlineshop/ui/widgets/local_info.dart';
import 'package:rubber/rubber.dart';

class ShopProfileScreen extends StatefulWidget {
  static const String routeName = "shop";

  const ShopProfileScreen({Key key}) : super(key: key);

  @override
  _ShopProfileScreenState createState() => _ShopProfileScreenState();
}

class _ShopProfileScreenState extends State<ShopProfileScreen>
    with SingleTickerProviderStateMixin {
  RubberAnimationController _rubberAnimationController;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _rubberAnimationController = RubberAnimationController(
      vsync: this,
      upperBoundValue: AnimationControllerValue(percentage: 1),
      lowerBoundValue: AnimationControllerValue(percentage: 0.65),
      duration: Duration(milliseconds: 200),
      initialValue: 0.65,
    );

    // _rubberAnimationController.addStatusListener((status) {
    //   print(status);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.shopping_basket,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        body: Container(
          child: RubberBottomSheet(
            scrollController: _scrollController,
            lowerLayer: _getSliderLayer(),
            upperLayer: ShopProfileContent(
              scrollController: _scrollController,
              rubberAnimationController: _rubberAnimationController,
            ),
            dragFriction: 0,
            animationController: _rubberAnimationController,
          ),
        ));
  }

  Widget _getSliderLayer() {
    return InkWell(
      onTap: () => print('das'),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35 + 20,
        width: double.infinity,
        child: Swiper(
          itemBuilder: (_, int index) {
            return InkWell(
              child: CachedNetworkImage(
                imageUrl:
                    'https://www.peru-retail.com/wp-content/uploads/kfc-grifo-Kio-peru.jpg',
                placeholder: (context, d) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                fit: BoxFit.cover,
              ),
            );
          },
          indicatorLayout: PageIndicatorLayout.SCALE,
          itemCount: 2,
          curve: Curves.elasticIn,
          pagination: new SwiperPagination(
            builder: new DotSwiperPaginationBuilder(
              color: Colors.white.withOpacity(0.7),
              activeColor: Colors.white,
              size: 10,
              activeSize: 8,
            ),
            alignment: Alignment(0.0, 0.7),
          ),
        ),
      ),
    );
  }
}
