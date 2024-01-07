import 'package:commons/commons.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/user_model.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/types.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/utils.dart';

import '../base/network/base_network.dart';
import '../routes/routes.dart';
import 'api_path.dart';

class SignUpProvider extends BaseNetWork {
  @override
  dynamic decodeField(body) => body['data'];
  Future<UesrModel?> signUp(
      {required String username,
      required String email,
      required String password}) async {
    final params = {
      "name": username,
      "email": email,
      "password": password,
      "avatar": "https://picsum.photos/800",
    }.json;

    final ApiRequest req = ApiRequest(
      path: ApiPath.signUp,
      method: METHOD.POST,
      auth: false,
      body: params,
    );
    LoadingOverlay.show();
    final res = await sendRequest(req);
    await Future.delayed(const Duration(milliseconds: 500));
    LoadingOverlay.close();
    if (res.success) {
      Storage.put(KEY.USER_MODEL, UesrModel.fromJson(res.body));
      Get.offAllNamed(Routes.signUpSuccess);
      return UesrModel.fromJson(res.body);
    } else {
      if (res.body['message'] != null &&
          (res.body['message'] as List).isNotEmpty) {
        Utils.showNotification(NOTIFICATION_TYPE.ERROR, "Sign Up",
            (res.body['message'] as List).first.toString());
      }
      return null;
    }
  }
}
