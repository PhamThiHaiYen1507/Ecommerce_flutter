import 'package:commons/commons.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/types.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/utils.dart';

import '../base/network/base_network.dart';
import '../models/login_data.dart';
import '../models/user_model.dart';
import 'api_path.dart';

class LoginProvider extends BaseNetWork {
  @override
  dynamic decodeField(body) => body['data'];
  Future<LoginData?> login(
      {String? email,
      String? password,
      Map<String, dynamic>? saveParams}) async {
    final params = {
      "email": email,
      "password": password,
    }.json;

    final ApiRequest req = ApiRequest(
      path: ApiPath.login,
      method: METHOD.POST,
      auth: false,
      body: saveParams ?? params,
    );
    final res = await sendRequest(req);
    await Future.delayed(const Duration(milliseconds: 500));

    if (res.success) {
      Storage.put(KEY.LOGIN_DATA, LoginData.fromJson(res.body));
      return LoginData.fromJson(res.body);
    } else {
      Utils.showNotification(NOTIFICATION_TYPE.ERROR, "Login",
          'Email or password is incorrect, please try again');
      return null;
    }
  }

  Future<UesrModel?> getProfile() async {
    final ApiRequest req =
        ApiRequest(path: ApiPath.profile, method: METHOD.GET, auth: true);

    final res = await sendRequest(
      req,
      decoder: UesrModel.fromJson,
    );

    if (res.success) {
      return res.body;
    } else {
      return null;
    }
  }
}
