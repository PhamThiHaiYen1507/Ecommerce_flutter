import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/app/app_bindings.dart';

import '../models/login_data.dart';
import '../routes/routes.dart';
import '../styles/styles.dart';
import '../utils/types.dart';

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: LoadingOverlay.instance.navigatorKey,
      theme: StyleConfigs.light,
      darkTheme: StyleConfigs.dark,
      themeMode: ThemeMode.light,
      initialBinding: AppBindings(),
      getPages: AppNavigate.screens,
      initialRoute: getLoginData() ? Routes.home : Routes.welcome,
    );
  }

  bool getLoginData() {
    final LoginData? loginData =
        Storage.get(KEY.LOGIN_DATA, LoginData.fromJson);
    if (loginData != null) {
      return true;
    }
    return false;
  }
}
