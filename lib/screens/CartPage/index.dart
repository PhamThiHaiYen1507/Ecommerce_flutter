import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/Home/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/text_define.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/Buttom/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/CartItem/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/NoData/index.dart';

import '../../widgets/BackButtonApp/index.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
                'My Cart',
                style: TextDefine.h2_B.copyWith(fontWeight: FontWeight.w900),
              ),
              Expanded(
                  child: Obx(() => homeController.myCart.value.isNotEmpty
                      ? ListView(
                          children: homeController.myCart.value
                              .map((data) => Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: CartItem(
                                        delete: () => homeController
                                            .delete(data.id ?? -1),
                                        productData: data,
                                        onAddQuantity: () => homeController
                                            .onAddQuantity(data.id ?? -1),
                                        onMinusQuantity: () => homeController
                                            .onMinusQuantity(data.id ?? -1)),
                                  ))
                              .toList())
                      : const NoData(
                          icon: Icons.shopping_cart_outlined,
                          text: 'Cart is empty'))),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Total (${homeController.myCart.value.length} item) : ',
                            style: TextDefine.t2_B.copyWith(color: neutral04)),
                        Text('\$${homeController.total.toString()}',
                            style: TextDefine.t1_B)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Button(onPressed: () {}, text: 'Proceed to checkout')
                ],
              )
            ],
          ),
        ));
  }
}
