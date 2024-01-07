import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/CategoryDetail/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/ProductDetail/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/BackButtonApp/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/ButtomSheetSearch/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/NoData/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/ProductItem/index.dart';
import 'package:shimmer/shimmer.dart';

import '../../styles/styles.dart';

class CategoryDetail extends StatelessWidget {
  final int categoryID;
  const CategoryDetail({super.key, required this.categoryID});

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return GetBuilder<CategoryDetailController>(
        init: CategoryDetailController(categoryID),
        builder: (conttroller) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 56),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BackButtonApp(),
                      InkWell(
                          onTap: () => Get.bottomSheet(BottomSheet(
                                onClosing: () {},
                                builder: (context) {
                                  return BottomSheetSearch(
                                      onSearch: (title, price) =>
                                          conttroller.getAllProduct(
                                              title: title, price: price));
                                },
                              )),
                          child: const Icon(Icons.search,
                              size: 30, color: neutral00)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Obx(() => conttroller.loading.value
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ListView(children: [
                              Wrap(
                                  direction: Axis.horizontal,
                                  runSpacing: 20,
                                  spacing: 20,
                                  children: [1, 2, 3, 4, 5, 6, 7, 8]
                                      .map(
                                        (e) => Container(
                                          decoration: BoxDecoration(
                                              color: neutral09,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          width: (size.width - 60) / 2,
                                          height: (size.width) / 2,
                                        ),
                                      )
                                      .toList()),
                              const SizedBox(height: 20)
                            ]),
                          )
                        : conttroller.productList.value.isNotEmpty
                            ? ListView(children: [
                                Wrap(
                                    direction: Axis.horizontal,
                                    runSpacing: 20,
                                    spacing: 20,
                                    children: conttroller.productList.value
                                        .map((e) => InkWell(
                                              onTap: () => Get.to(() =>
                                                  ProductDetail(
                                                      productId: e.id ?? -1)),
                                              child: ProductItem(
                                                  productData: e,
                                                  onFavourite: () => conttroller
                                                      .onFavourite(context, e)),
                                            ))
                                        .toList()),
                                const SizedBox(height: 20)
                              ])
                            : const NoData(
                                icon: Icons.shopping_cart_outlined,
                                text: 'No Product')),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
