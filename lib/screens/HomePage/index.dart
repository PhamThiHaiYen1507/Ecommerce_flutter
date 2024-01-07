import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/CategoryDetail/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/Home/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/HomePage/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/text_define.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/CategoryItem/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/NoData/index.dart';
import 'package:shimmer/shimmer.dart';
import '../../widgets/BackButtonApp/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final HomePageController homePageController = Get.put(HomePageController());
    final size = Get.size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 56),
            BackButtonApp(onPressed: () {
              homeController.typeHome.value = TYPE_HOME.HOME;
              homeController.onChangePage();
            }),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: neutral07.withOpacity(0.1)),
              child: TextField(
                focusNode: homePageController.searchFocus,
                controller: homePageController.search,
                onChanged: homePageController.searchcategoty,
                cursorColor: neutral00,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(1),
                  isDense: true,
                  hintText: 'Search category',
                  hintStyle: TextDefine.t2_R.copyWith(color: neutral08),
                  prefixIcon:
                      const Icon(Icons.search, size: 30, color: neutral00),
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  prefixIconConstraints:
                      const BoxConstraints(minHeight: 0, minWidth: 40),
                ),
              ),
            ),
            Expanded(
              child: Obx(() => !homePageController.loading.value
                  ? homePageController.categoryList.value.isNotEmpty
                      ? ListView(children: [
                          Wrap(
                              direction: Axis.horizontal,
                              runSpacing: 20,
                              spacing: 20,
                              children: homePageController.searchList.value
                                  .map((e) => InkWell(
                                      onTap: () => Get.to(() => CategoryDetail(
                                          categoryID: e.id ?? -1)),
                                      child: CategoryItem(categoryData: e)))
                                  .toList()),
                          const SizedBox(height: 20)
                        ])
                      : const NoData(
                          icon: Icons.category_outlined, text: 'No Category')
                  : Shimmer.fromColors(
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
                    )),
            ),
          ],
        ),
      ),
    );
  }
}
