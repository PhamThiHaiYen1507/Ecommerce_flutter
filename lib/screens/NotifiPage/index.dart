import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

import '../../styles/text_define.dart';
import '../../widgets/BackButtonApp/index.dart';
import '../../widgets/NoData/index.dart';
import '../Home/controller.dart';

class NotifiPage extends StatelessWidget {
  const NotifiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return WillPopScope(
        onWillPop: () async {
          homeController.typeHome.value = TYPE_HOME.HOME;
          homeController.onChangePage();
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              BackButtonApp(onPressed: () {
                homeController.typeHome.value = TYPE_HOME.HOME;
                homeController.onChangePage();
              }),
              const SizedBox(height: 10),
              Text(
                'Notification',
                style: TextDefine.h2_B.copyWith(fontWeight: FontWeight.w900),
              ),
              const Expanded(
                  child: NoData(
                      icon: Icons.notification_important,
                      text: 'Notifycation is empty')
                  // Obx(
                  //   () => homeController.myCart.value.isNotEmpty
                  //       ? ListView(
                  //           children: homeController.myCart.value
                  //               .map((data) => const Padding(
                  //                     padding: EdgeInsets.only(bottom: 20),
                  //                     child: SizedBox(),
                  //                   ))
                  //               .toList())
                  //       : const NoData(
                  //           icon: Icons.notification_important,
                  //           text: 'Notifycation is empty'),
                  // ),
                  ),
            ],
          ),
        ));
  }
}
