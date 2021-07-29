import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
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

  void getBanner() async {
    var list = await getBanners(callback: () {
      setState(() {
        _isLoading = false;
      });
    });
    imgList = list.sublist(0, list.length - 1);
    setState(() {
      featureBanner = list[list.length - 1];
    });
    await precacheBanners(list, () {
      setState(() {
        _isLoading = false;
      });
    }, context);
  }

  @override
  void initState() {
    featureBanner = null;
    getBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SpinKitCircle(color: Colors.blue)
        : Container(
            color: kScaffoldGrey,
            child: ListView(children: [
              BannerSlider(imgList: imgList),
              CategoryLayout(),
              HomeLayout1(
                name: 'New',
                color: Colors.orange[100]!,
              ),
              featureBanner != null
                  ? HomeLayout2(
                      image: featureBanner,
                    )
                  : Container()
            ]));
  }
}
