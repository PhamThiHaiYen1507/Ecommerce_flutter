import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/text_define.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/svg.dart';

import '../../utils/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../flip_book/index.dart';
import 'controller.dart';

class MultipleImage extends StatelessWidget {
  final List<String> images;
  const MultipleImage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    TabController? tabController;
    final size = Get.size;
    return GetBuilder<MutipleImageController>(
        init: MutipleImageController(images),
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              Utils.showCustomDialog(
                  context: context,
                  contentPadding: EdgeInsets.zero,
                  insetPadding: EdgeInsets.zero,
                  radius: 0,
                  content: FlipBook(
                    images: images,
                  ));
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                CarouselSlider.builder(
                  carouselController: controller.carouselController,
                  itemCount: images.length,
                  itemBuilder: (ctx, i, _) => Stack(
                    children: [
                      SizedBox.expand(
                          child: Image.network(
                        images[i],
                        fit: BoxFit.cover,
                        width: size.width,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          Picture.splash,
                          width: size.width,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              SizedBox(
                            height: size.height * 0.2,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ),
                      )),
                    ],
                  ),
                  options: CarouselOptions(
                    enableInfiniteScroll: images.length > 1,
                    viewportFraction: 1,
                    height: size.width,
                    onPageChanged: (i, reason) {
                      tabController?.animateTo(i < 4 ? i : 4);
                    },
                  ),
                ),
                if (images.length > 1)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: DefaultTabController(
                      length: images.take(5).length,
                      child: Builder(builder: (context) {
                        tabController = DefaultTabController.of(context);
                        return TabBar(
                            onTap: (value) {
                              controller.carouselController.animateToPage(
                                  value < 4 ? value : 4,
                                  duration: const Duration(milliseconds: 200));
                            },
                            indicatorPadding: EdgeInsets.zero,
                            isScrollable: true,
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 2),
                            padding: EdgeInsets.zero,
                            indicator: BoxDecoration(
                              border: Border.all(color: neutral10),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                            ),
                            tabs: [
                              ...images
                                  .take(4)
                                  .map((e) => ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4)),
                                        child: SizedBox(
                                          height: 48,
                                          width: 48,
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 1),
                                              child: Image.network(
                                                e,
                                                fit: BoxFit.cover,
                                                width: size.width,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  Picture.splash,
                                                  width: size.width,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      SizedBox(
                                                    height: size.height * 0.3,
                                                    child: const Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ))
                                  .toList(),
                              if (images.length >= 5)
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 48,
                                        width: 48,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 1),
                                          child: Image.network(
                                            images[4],
                                            fit: BoxFit.cover,
                                            width: size.width,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              Picture.splash,
                                              width: size.width,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  SizedBox(
                                                height: size.height * 0.3,
                                                child: const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (images.length > 5)
                                        Positioned.fill(
                                          child: Container(
                                            color: Colors.black45,
                                            alignment: Alignment.center,
                                            child: Text(
                                              '+${images.length - 5}',
                                              style: TextDefine.t2_R.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                )
                            ]);
                      }),
                    ),
                  ),
              ],
            ),
          );
        });
  }
}
