import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/product_data.dart';

import '../../styles/styles.dart';
import '../../styles/text_define.dart';
import '../../utils/svg.dart';

class FavouritesItem extends StatelessWidget {
  final ProductData productData;
  final void Function() delete;

  const FavouritesItem(
      {super.key, required this.productData, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 50,
      padding: const EdgeInsets.all(12),
      height: Get.height * 0.16,
      decoration: BoxDecoration(
          color: neutral10,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                offset: const Offset(0, 2),
                color: neutral00.withOpacity(0.4))
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: Image.network(productData.images?.first ?? '',
                width: Get.height * 0.16 - 32,
                height: Get.height * 0.16 - 32,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset(Picture.splash),
                fit: BoxFit.fitHeight),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(productData.title ?? '',
                                style: TextDefine.t2_B,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        IconButton(
                            onPressed: delete, icon: const Icon(Icons.delete))
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(productData.description ?? '',
                        style: TextDefine.te1_B.copyWith(color: neutral06),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ ${productData.price.toString()}',
                        style: TextDefine.t2_B),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
