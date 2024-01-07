import 'dart:convert';

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/login_data.dart';
import 'package:nws_yenpth1_ecommerce_flutter/providers/login_provider.dart';

import '../../routes/routes.dart';
import '../../utils/types.dart';

class LoginController extends GetxController {
  late final LoginProvider _loginProvider;
  late final TextEditingController email, password;
  late final FocusNode emailFocus, passwordFocus;
  late final RxBool showPassword, enabled;

  @override
  void onInit() {
    _loginProvider = LoginProvider();
    email = TextEditingController();
    password = TextEditingController();
    passwordFocus = FocusNode();
    emailFocus = FocusNode();
    showPassword = RxBool(false);
    enabled = RxBool(false);
    super.onInit();
  }

  @override
  void onReady() {
    email.addListener(() {
      _validateLogin();
    });
    password.addListener(() {
      _validateLogin();
    });
    super.onReady();
  }

  Future<void> onConfirm() async {
    LoadingOverlay.show();
    final LoginData? loginData =
        await _loginProvider.login(password: password.text, email: email.text);
    LoadingOverlay.close();
    if (loginData != null) {
      Get.offAllNamed(Routes.home);
      Storage.put(KEY.LOGIN_DATA.toString(), json.encode(loginData.toJson()));
    }
    passwordFocus.unfocus();
    emailFocus.unfocus();
  }

  void _validateLogin() {
    enabled(email.text.isNotEmpty && password.text.isNotEmpty);
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    passwordFocus.dispose();
    emailFocus.dispose();
    super.onClose();
  }
}
