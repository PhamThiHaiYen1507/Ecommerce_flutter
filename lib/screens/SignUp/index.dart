import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/SignUp/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/text_define.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/svg.dart';

import '../../widgets/Buttom/index.dart';
import '../../widgets/CustomTextField/index.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SignUpController(),
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
                                  const Text("Sign Up", style: TextDefine.h2_B),
                                  const SizedBox(height: 8),
                                  Text("Creat an new account",
                                      style: TextDefine.t2_R
                                          .copyWith(color: neutral04)),
                                  const SizedBox(height: 40),
                                  CustomTextField(
                                    labelText: 'User Name',
                                    controller: c.username,
                                    focusNode: c.usernameFoucus,
                                  ),
                                  const SizedBox(height: 20),
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
                                  const SizedBox(height: 20),
                                  Obx(
                                    () => CustomTextField(
                                      stringError: c.confirmPassWordError.value,
                                      labelText: 'Confirm Password',
                                      obscureText: !c.showConfirmPassword.value,
                                      controller: c.confirmPassWord,
                                      focusNode: c.confirmPassWordFocus,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.deny(' '),
                                      ],
                                      suffixIcon: InkWell(
                                        onTap: c.showConfirmPassword.toggle,
                                        child: SizedBox(
                                            height: 18,
                                            width: 18,
                                            child: Obx(
                                              () => Center(
                                                child: c.showConfirmPassword
                                                        .value
                                                    ? const Icon(
                                                        Icons
                                                            .remove_red_eye_outlined,
                                                        color: neutral00)
                                                    : SvgPicture.asset(
                                                        SvgIcon.hide_password,
                                                        height: 18,
                                                      ),
                                              ),
                                            )),
                                      ),
                                    ),
                                  )
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
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                  value: c.agree.value,
                                  onChanged: c.onCheckBox)),
                              const SizedBox(width: 4),
                              Text(
                                  "By creating an account you have to agree\nwith our them & condication.",
                                  style: TextDefine.t2_R
                                      .copyWith(color: neutral06))
                            ],
                          ),
                          const SizedBox(height: 8),
                          Obx(
                            () {
                              return Button(
                                  disableColor: neutral08,
                                  enabled: c.enabled.value,
                                  backgroundColor: neutral00,
                                  textColor: neutral10,
                                  onPressed: c.onConfirm,
                                  text: "Sign Up");
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
