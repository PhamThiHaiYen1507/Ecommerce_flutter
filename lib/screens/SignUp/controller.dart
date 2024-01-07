import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

import '../../providers/sign_up_provider.dart';

class SignUpController extends GetxController {
  late final TextEditingController username, email, password, confirmPassWord;
  late final SignUpProvider _signUpProvider;
  late final FocusNode passwordFocus,
      confirmPassWordFocus,
      usernameFoucus,
      emailFocus;
  late final RxString confirmPassWordError;
  late final RxBool showPassword,
      showConfirmPassword,
      enabled,
      agree;
  @override
  void onInit() {
    _signUpProvider = SignUpProvider();
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassWord = TextEditingController();
    showConfirmPassword = RxBool(false);
    passwordFocus = FocusNode();
    confirmPassWordFocus = FocusNode();
    usernameFoucus = FocusNode();
    emailFocus = FocusNode();
    confirmPassWordError = RxString('');
    showPassword = RxBool(false);
    enabled = RxBool(false);
    agree = RxBool(false);

    super.onInit();
  }

  Future<void> onConfirm() async {
    await _signUpProvider.signUp(
        password: password.text, email: email.text, username: username.text);
    usernameFoucus.unfocus();
    passwordFocus.unfocus();
    confirmPassWordFocus.unfocus();
    emailFocus.unfocus();
  }

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    password.dispose();
    confirmPassWord.dispose();
    passwordFocus.dispose();
    confirmPassWordFocus.dispose();
    usernameFoucus.dispose();
    emailFocus.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    username.addListener(() {
      listenEnableButton();
    });
    email.addListener(() {
      listenEnableButton();
    });
    password.addListener(() {
      listenEnableButton();
      checkPassWord();
    });
    confirmPassWord.addListener(() {
      listenEnableButton();
      checkPassWord();
    });
    super.onReady();
  }

  void listenEnableButton() {
    enabled(username.text.trim().isNotEmpty &&
        email.text.trim().isNotEmpty &&
        password.text.trim().isNotEmpty &&
        confirmPassWord.text.trim().isNotEmpty &&
        agree.value);
  }

  void onCheckBox(bool? value) {
    agree(value);
    listenEnableButton();
  }

  void checkPassWord() {
    if (passwordFocus.hasFocus || confirmPassWordFocus.hasFocus) {
      if (password.text != confirmPassWord.text) {
        confirmPassWordError.value =
            'Password and Confirm Password are not match';
      } else {
        confirmPassWordError.value = '';
      }
    }
  }
}
