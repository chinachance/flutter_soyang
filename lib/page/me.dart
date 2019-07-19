import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soyang/mvp/base_page_state.dart';
import 'package:flutter_soyang/mvp/presenter/me_presenter.dart';
import 'package:flutter_soyang/utils/Utils.dart';

class MePage extends StatefulWidget {
  const MePage() : super();

  @override
  MeState createState() {
    return MeState();
  }
}

class MeState extends BasePageState<MePage, MePresenter>
    with AutomaticKeepAliveClientMixin<MePage> {
  /// 头像
  String _img;

  void setImg(String img) {
    setState(() {
      _img = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CircleAvatar(
        radius: 28.0,
        backgroundImage: _img == null
            ? AssetImage(
                Utils.getImgPath('user/tx'),
              )
            : CachedNetworkImageProvider(_img),
      )
    ]);
  }

  @override
  MePresenter createPresenter() {
    return MePresenter();
  }

  @override
  bool get wantKeepAlive => true;
}
