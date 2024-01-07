import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/text_define.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/svg.dart';

import '../../models/product_data.dart';

class ProductItem extends StatelessWidget {
  final void Function() onFavourite;
  final ProductData productData;
  const ProductItem(
      {super.key, required this.productData, required this.onFavourite});

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
                width: (size.width - 60) / 2,
                height: (size.width) / 2,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.network(productData.images?.first ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset(Picture.splash, fit: BoxFit.cover))),
            Positioned(
                right: 10,
                top: 10,
                child: InkWell(
                    onTap: onFavourite,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          color: neutral10,
                          borderRadius: BorderRadius.circular(16)),
                      child: Icon(
                          productData.favourite == true
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: neutral00),
                    )))
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: (size.width - 60) / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(productData.title ?? '',
                  style: TextDefine.t2_B,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text(productData.description ?? '',
                  style: TextDefine.te1_B.copyWith(color: neutral06),
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text('\$ ${productData.price.toString()}', style: TextDefine.t2_B)
            ],
          ),
        )
      ],
    );
  }
}
