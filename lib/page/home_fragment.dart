import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soyang/components/app_bar.dart';
import 'package:flutter_soyang/res/colors.dart';
import 'package:flutter_soyang/res/dimens.dart';
import 'package:flutter_soyang/res/styles.dart';

class HomeFragmentPage extends StatefulWidget {
  const HomeFragmentPage() : super();

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomeFragmentPage> {
  SwiperController swiperController;

  @override
  void initState() {
    super.initState();
    swiperController = new SwiperController();
    swiperController.addListener(() {
      print(swiperController.index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    swiperController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: '首页',
        isBack: false,
        backgroundColor: Colours.app_main,
      ),
      body: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Swiper(
              indicatorAlignment: AlignmentDirectional.bottomCenter,
              controller: swiperController,
              speed: Dimens.banner_speed,
              indicator: CircleSwiperIndicator(),
              children: <Widget>[
                Image.asset(
                  "assets/images/banner/banner_one.jpg",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/images/banner/banner_two.jpg",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/images/banner/banner_three.jpg",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/images/banner/banner_four.jpg",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/images/banner/banner_five.jpg",
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
          Gaps.vGap10,
        ],
      ),
    );
  }
}
