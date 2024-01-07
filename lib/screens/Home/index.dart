import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/Home/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/BottomNavigationBar/index.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: const BottomNavigationBarHome(),
            body: Obx(() => controller.currentPage.value),
          );
        });
  }
}
