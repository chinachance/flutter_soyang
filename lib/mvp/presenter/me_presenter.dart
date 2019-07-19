import 'package:flutter/material.dart';
import 'package:flutter_soyang/model/user_entity.dart';
import 'package:flutter_soyang/net/dio_utils.dart';
import 'package:flutter_soyang/page/me.dart';

import '../base_page_presenter.dart';

class MePresenter extends BasePagePresenter<MeState> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 接口请求例子
      /// get请求参数queryParameters  post请求参数params
      requestNetwork<UserEntity>(
          Method.get, "users/simplezhli", onSuccess: (data) {
        print(data.avatarUrl);
        view.setImg(data.avatarUrl);
      });
    });
  }
}
