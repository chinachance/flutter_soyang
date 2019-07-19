import 'model/user_entity.dart';
import 'net/account_entity.dart';

///每个网络请求都需要在此转javabean,所以,所有网络的javabean都需要在此加上转换的方法
///否则,onSuccess拿到的data为null
class EntityFactory {
  ///json转javabean
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AccountEntity") {
      return AccountEntity.fromJson(json) as T;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
