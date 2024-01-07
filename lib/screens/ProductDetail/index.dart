import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/BackButtonApp/index.dart';
import 'package:shimmer/shimmer.dart';
import '../../styles/text_define.dart';
import '../../widgets/MultipleImage/index.dart';
import 'controller.dart';

class ProductDetail extends StatelessWidget {
  final int productId;
  const ProductDetail({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return GetBuilder<ProductDetailController>(
        init: ProductDetailController(productId),
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Obx(() => controller.loading.value
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                      color: neutral04, height: size.width))
                              : MultipleImage(
                                  images:
                                      controller.productData.value?.images ??
                                          [])),
                          const Positioned(
                            top: 10,
                            left: 10,
                            child: BackButtonApp(),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: InkWell(
                                onTap: () => controller.onFavourite(context),
                                child: Obx(() => Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                          color: neutral10,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Icon(
                                          controller.productData.value
                                                      ?.favourite ==
                                                  true
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: neutral00),
                                    ))),
                          ),
                          Positioned(
                            child: Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: neutral10,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16)))),
                          )
                        ],
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        controller.productData.value?.title ??
                                            '',
                                        style: TextDefine.h2_B,
                                        overflow: TextOverflow.ellipsis),
                                    const SizedBox(height: 8),
                                    Text(
                                        controller.productData.value
                                                ?.description ??
                                            '',
                                        style: TextDefine.t2_B
                                            .copyWith(color: neutral06),
                                        overflow: TextOverflow.ellipsis),
                                    const SizedBox(height: 8),
                                    Row(children: [
                                      ...[1, 2, 3, 4, 5]
                                          .map((e) => const Icon(Icons.star,
                                              color: Colors.orange))
                                          .toList(),
                                      const SizedBox(width: 6),
                                      const Text('(123 review)',
                                          style: TextDefine.t2_B)
                                    ])
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  Container(
                                      width: size.width * 0.2,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: neutral03.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap: controller.onMinusQuantity,
                                              child: const Text('-',
                                                  style: TextDefine.t1_B)),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                  controller.quantity.value
                                                      .toString(),
                                                  style: TextDefine.t1_B),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: controller.onAddQuantity,
                                              child: const Text('+',
                                                  style: TextDefine.t1_B)),
                                        ],
                                      )),
                                  const SizedBox(height: 8),
                                  const Text('Available in stock',
                                      style: TextDefine.t2_B)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text('Size',
                                style: TextDefine.t1_B,
                                overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Row(
                                      children: sizeList
                                          .map((e) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16),
                                                child: InkWell(
                                                  onTap: () =>
                                                      controller.selectSize(e),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: Get.width * 0.12,
                                                    width: Get.width * 0.12,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: neutral07),
                                                        color: controller
                                                                    .selectSize
                                                                    .value ==
                                                                e
                                                            ? neutral00
                                                            : neutral10,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    Get.width *
                                                                        0.06)),
                                                    child: Text(e,
                                                        style: TextDefine.t1_B.copyWith(
                                                            color: controller
                                                                        .selectSize
                                                                        .value ==
                                                                    e
                                                                ? neutral10
                                                                : neutral00)),
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    )),
                                Obx(() => Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: neutral10,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 8,
                                                offset: const Offset(2, 2),
                                                color:
                                                    neutral00.withOpacity(0.4))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Row(
                                        children: colorList
                                            .map((e) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16),
                                                  child: InkWell(
                                                    onTap: () => controller
                                                        .selectColor(e),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: Get.width * 0.06,
                                                      width: Get.width * 0.06,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: neutral07),
                                                          color: e,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      Get.width *
                                                                          0.03)),
                                                      child: controller
                                                                  .selectColor
                                                                  .value ==
                                                              e
                                                          ? const Icon(
                                                              Icons.done,
                                                              size: 18,
                                                              color: neutral10)
                                                          : null,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text('Description',
                                style: TextDefine.t1_B,
                                overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 10),
                            Obx(
                              () => Text(
                                  controller.productData.value?.description ??
                                      '',
                                  style: TextDefine.te1_R
                                      .copyWith(color: neutral06)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          width: Get.width - 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: neutral00),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Obx(
                                () => Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    '\$${controller.total.value.toString()}',
                                    style: TextDefine.t1_B
                                        .copyWith(color: neutral10),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () => controller.addMyCart(context),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: neutral10),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.lock, color: neutral00),
                                      SizedBox(width: 10),
                                      Text(
                                        'Add to cart',
                                        style: TextDefine.t1_B,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
