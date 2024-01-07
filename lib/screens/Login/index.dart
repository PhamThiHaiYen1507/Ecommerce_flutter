import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/Login/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/svg.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/Buttom/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/CustomTextField/index.dart';

import '../../styles/text_define.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginController(),
        builder: (c) => GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Scaffold(
                appBar: AppBar(leading: const BackButton(color: neutral00)),
                body: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                              child: Center(
                                  child:
                                      Image.asset(Picture.logo, height: 300))),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Wel come",
                                      style: TextDefine.h2_B),
                                  const SizedBox(height: 8),
                                  Text(
                                      "Please login or sign up to continue our app",
                                      style: TextDefine.t2_R
                                          .copyWith(color: neutral04)),
                                  const SizedBox(height: 60),
                                  CustomTextField(
                                    labelText: 'Email',
                                    controller: c.email,
                                    focusNode: c.emailFocus,
                                  ),
                                  const SizedBox(height: 20),
                                  Obx(
                                    () => CustomTextField(
                                      labelText: 'Password',
                                      obscureText: !c.showPassword.value,
                                      controller: c.password,
                                      focusNode: c.passwordFocus,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.deny(' '),
                                      ],
                                      suffixIcon: InkWell(
                                        onTap: c.showPassword.toggle,
                                        child: SizedBox(
                                          height: 18,
                                          width: 18,
                                          child: Center(
                                            child: c.showPassword.value
                                                ? const Icon(
                                                    Icons
                                                        .remove_red_eye_outlined,
                                                    color: neutral00)
                                                : SvgPicture.asset(
                                                    SvgIcon.hide_password,
                                                    height: 18,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () {
                              return Button(
                                  disableColor: neutral08,
                                  enabled: c.enabled.value,
                                  backgroundColor: neutral00,
                                  textColor: neutral10,
                                  onPressed: c.onConfirm,
                                  text: "Login");
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
