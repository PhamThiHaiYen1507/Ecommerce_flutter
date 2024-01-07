import 'package:commons/app_logger/app_logger.dart';
import 'package:commons/commons.dart';
import 'package:commons/os_info/os_info.dart';
import 'package:cryptography_flutter/cryptography_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/login_data.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/svg.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/types.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/LoadingIndicator/index.dart';

import 'base/app_config/app_config.dart';
import 'base/network/base_network.dart';

void showLoadingCircle() => Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: const SizedBox.expand(
          child: Center(
            child: LoadingIndicator(),
          ),
        ),
      ),
      barrierDismissible: true,
      routeSettings: const RouteSettings(name: 'loading'),
    );

void hideLoadingCircle() => Get.back(result: false, closeOverlays: false);

class Global {
  static Future<void> initial() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterCryptography.registerWith();
    if (AppConfig.info.env == ENV.DEV ||
        (AppConfig.info.env == ENV.PROD && kDebugMode)) AppLogger.init();

    // if (!kIsWeb) AppConnection.init();
    await Storage.init();
    if (!kIsWeb) await OsInfo.init();

    LoadingOverlay(
        barrierColor: Colors.black26,
        indicator: Image.asset(height: 80, Picture.loading));

    BaseNetworkConfig.initial(
      baseUrl: AppConfig.info.baseUrl,
      secure: AppConfig.info.secure,
      getAccessToken: _getAccessToken,
      getRefreshToken: _getRefreshToken,
    );
  }

  static Future<String?> _getAccessToken() async {
    final LoginData? loginData =
        Storage.get(KEY.LOGIN_DATA, LoginData.fromJson);

    return 'Bearer ${loginData?.accessToken ?? ''}';
  }

  static Future<String?> _getRefreshToken(Dio dio) async {
    final LoginData? loginData =
        Storage.get(KEY.LOGIN_DATA, LoginData.fromJson);

    if (loginData != null) {
      final params = {
        'refresh_token': loginData.refreshToken,
      };

      final Uri uri = getUri(AppConfig.info.baseUrl, '/api/v1/refreshToken', {},
          AppConfig.info.secure);
      final res = await dio.post(uri.toString(),
          data: params,
          options: Options(
            validateStatus: (status) => status != null,
          ));

      if (res.statusCode == 200) {
        final loginData = LoginData.fromJson(res.data);
        Storage.put(KEY.LOGIN_DATA,
            LoginData.fromJson({...loginData.toJson(), ...res.data}));
        return 'Bearer ${loginData.accessToken}';
      } else {
        return null;
      }
    }
    return null;
  }
}
