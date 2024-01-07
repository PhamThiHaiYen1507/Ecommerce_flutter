import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/routes/routes.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/text_define.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/Buttom/index.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.done_all_outlined,
                        color: Colors.green, size: 100),
                    const SizedBox(height: 20),
                    Text('Successful!',
                        style: TextDefine.h1_B
                            .copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 10),
                    Text(
                        'You have successfully registered in\nour app and start working in it.',
                        style: TextDefine.t2_B.copyWith(color: neutral06),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
                child: Button(
                    backgroundColor: neutral00,
                    textColor: neutral10,
                    onPressed: () => Get.offAllNamed(Routes.login),
                    text: 'Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
