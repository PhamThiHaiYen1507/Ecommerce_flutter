import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/Favourites/index.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/Home/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/ProfilePage/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/text_define.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/svg.dart';

import '../../widgets/BackButtonApp/index.dart';
import '../../widgets/Buttom/index.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController h = Get.find();
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      BackButtonApp(onPressed: () {
                        h.typeHome.value = TYPE_HOME.HOME;
                        h.onChangePage();
                      }),
                      Center(
                        child: SizedBox(
                          height: Get.width / 4,
                          width: Get.width / 4,
                          child: ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                  h.userModel.value?.avatar ?? '',
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(Picture.logo))),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text('Name',
                                  style: TextDefine.t2_B
                                      .copyWith(color: neutral06)),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(h.userModel.value?.name ?? '',
                                  style: TextDefine.t2_B),
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text('Email',
                                  style: TextDefine.t2_B
                                      .copyWith(color: neutral06)),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(h.userModel.value?.email ?? '',
                                  style: TextDefine.t2_B),
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 40),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 32),
                          width: Get.width - 32,
                          decoration: BoxDecoration(
                              border: Border.all(color: neutral07),
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: neutral06.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Icon(Icons.person),
                                  ),
                                  const SizedBox(width: 16),
                                  Text('Personal Details',
                                      style: TextDefine.t2_B.copyWith(
                                          fontWeight: FontWeight.w900)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.navigate_next_rounded))
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: neutral06.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4)),
                                    child:
                                        const Icon(Icons.shopping_cart_sharp),
                                  ),
                                  const SizedBox(width: 16),
                                  Text('My cart',
                                      style: TextDefine.t2_B.copyWith(
                                          fontWeight: FontWeight.w900)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        h.typeHome.value = TYPE_HOME.CART;
                                        h.onChangePage();
                                      },
                                      icon: const Icon(
                                          Icons.navigate_next_rounded))
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: neutral06.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Icon(Icons.favorite),
                                  ),
                                  const SizedBox(width: 16),
                                  Text('My favourites',
                                      style: TextDefine.t2_B.copyWith(
                                          fontWeight: FontWeight.w900)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        Get.to(() => const Favourites());
                                      },
                                      icon: const Icon(
                                          Icons.navigate_next_rounded))
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: neutral06.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Icon(Icons.shopping_bag),
                                  ),
                                  const SizedBox(width: 16),
                                  Text('My order',
                                      style: TextDefine.t2_B.copyWith(
                                          fontWeight: FontWeight.w900)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.navigate_next_rounded))
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(height: 20),
                      Text("Settings",
                          style: TextDefine.t1_B.copyWith(
                              fontWeight: FontWeight.w900, fontSize: 20)),
                      const SizedBox(height: 20),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 32),
                          width: Get.width - 32,
                          decoration: BoxDecoration(
                              border: Border.all(color: neutral07),
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: neutral06.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Icon(Icons.language),
                                  ),
                                  const SizedBox(width: 16),
                                  Text('Language',
                                      style: TextDefine.t2_B.copyWith(
                                          fontWeight: FontWeight.w900)),
                                  const Spacer(),
                                  Text('English',
                                      style: TextDefine.te1_R
                                          .copyWith(color: neutral06)),
                                  const SizedBox(width: 16),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.navigate_next_rounded))
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: neutral06.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Icon(Icons.notifications),
                                  ),
                                  const SizedBox(width: 16),
                                  Text('Notification',
                                      style: TextDefine.t2_B.copyWith(
                                          fontWeight: FontWeight.w900)),
                                  const Spacer(),
                                  Switch(
                                    activeColor: neutral01,
                                    value: true,
                                    onChanged: (value) {},
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: neutral06.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Icon(Icons.nightlight_sharp),
                                  ),
                                  const SizedBox(width: 16),
                                  Text('Dark Mood',
                                      style: TextDefine.t2_B.copyWith(
                                          fontWeight: FontWeight.w900)),
                                  const Spacer(),
                                  Switch(
                                    activeColor: neutral01,
                                    value: true,
                                    onChanged: (value) {},
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: neutral06.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Icon(Icons.help),
                                  ),
                                  const SizedBox(width: 16),
                                  Text('Help Center',
                                      style: TextDefine.t2_B.copyWith(
                                          fontWeight: FontWeight.w900)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.navigate_next_rounded))
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(height: 50),
                    ],
                  )),
                  SliverToBoxAdapter(
                      child: Button(
                          onPressed: () => controller.logOut(),
                          text: 'Log Out')),
                ],
              ),
            ),
          );
        });
  }
}
