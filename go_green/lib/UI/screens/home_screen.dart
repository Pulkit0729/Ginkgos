import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/UI/widgets/homeScreen/bannerSlider.dart';
import 'package:go_green/UI/widgets/homeScreen/categoryLayout.dart';
import 'package:go_green/UI/widgets/homeScreen/homeLayout1.dart';
import 'package:go_green/UI/widgets/homeScreen/homeLayout2.dart';
import 'package:go_green/backend/provider/firebase/getHomeScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  List<String> imgList = [];

  late String? featureBanner;
  late String? promoBanner;

  void getBanner() async {
    var list = await getBanners(
        callback: () => setState(() {
              _isLoading = false;
              getBanner();
            }));

    setState(() {
      imgList = list.sublist(0, list.length - 2);
      featureBanner = list[list.length - 2];
      promoBanner = list[list.length - 1];
    });
    await precacheBanners(
        list[0],
        () => setState(() {
              _isLoading = false;
            }),
        context);
  }

  @override
  void initState() {
    featureBanner = null;
    promoBanner = null;
    getBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CustomLoader()
        : Container(
            color: kScaffoldGrey,
            child: ListView(cacheExtent: 2000, children: [
              BannerSlider(imgList: imgList),
              CategoryLayout(),
              HomeLayout1(name: 'New', color: Colors.orange[100]!),
              featureBanner != null
                  ? HomeLayout2(image: featureBanner)
                  : Container(),
              HomeLayout1(name: 'Trending', color: Colors.pink[100]!),
              promoBanner != null
                  ? HomeLayout2(image: promoBanner)
                  : Container(),
              HomeLayout1(
                name: 'Must Buy Indoor',
                color: Colors.redAccent[100]!,
              )
            ]));
  }
}
