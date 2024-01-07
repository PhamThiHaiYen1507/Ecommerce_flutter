import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/Home/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/text_define.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/FavouritesItem/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/NoData/index.dart';

import '../../widgets/BackButtonApp/index.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const BackButtonApp(),
            const SizedBox(height: 10),
            Text(
              'My favourites',
              style: TextDefine.h2_B.copyWith(fontWeight: FontWeight.w900),
            ),
            Expanded(
                child: Obx(() => homeController.myFavouties.value.isNotEmpty
                    ? ListView(
                        children: homeController.myFavouties.value
                            .map((data) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: FavouritesItem(
                                    delete: () => homeController
                                        .deleteFavourites(data.id ?? -1),
                                    productData: data,
                                  ),
                                ))
                            .toList())
                    : const NoData(
                        icon: Icons.shopping_cart_outlined,
                        text: 'My favourites is empty'))),
          ],
        ),
      ),
    );
  }
}
