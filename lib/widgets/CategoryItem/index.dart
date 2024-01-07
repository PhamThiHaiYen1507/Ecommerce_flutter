import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/category_data.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/text_define.dart';

import '../../utils/svg.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData categoryData;
  const CategoryItem({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Stack(
      children: [
        Container(
            width: (size.width - 60) / 2,
            height: (size.width) / 2,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Image.network(categoryData.image ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset(Picture.splash, fit: BoxFit.cover))),
        Positioned(
            bottom: 0,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: (size.width - 60) / 2,
                decoration: BoxDecoration(
                    color: neutral10.withOpacity(0.6),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(categoryData.name ?? '',
                        style: TextDefine.t1_B, textAlign: TextAlign.center),
                    const Text('... Product', style: TextDefine.te1_B)
                  ],
                )))
      ],
    );
  }
}
