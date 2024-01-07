import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/widgets/Buttom/index.dart';

import '../../styles/text_define.dart';
import 'controller.dart';

class BottomSheetSearch extends StatelessWidget {
  final void Function(String title, String price) onSearch;
  const BottomSheetSearch({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetSearchController>(
        init: BottomSheetSearchController(),
        builder: (controller) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Column(
                children: [
                  Center(
                    child: Text('Search product',
                        style: TextDefine.h2_B.copyWith(color: neutral00)),
                  ),
                  const SizedBox(height: 8),
                  const Divider(thickness: 2),
                  Expanded(
                    child: ListView(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: neutral07.withOpacity(0.1)),
                          child: TextField(
                            controller: controller.name,
                            cursorColor: neutral00,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(1),
                              isDense: true,
                              hintText: 'Search by name',
                              hintStyle:
                                  TextDefine.t2_R.copyWith(color: neutral08),
                              prefixIcon:
                                  const Text('Name', style: TextDefine.t1_B),
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              prefixIconConstraints: const BoxConstraints(
                                  minHeight: 0, minWidth: 70),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: neutral07.withOpacity(0.1)),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: controller.price,
                            cursorColor: neutral00,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(1),
                              isDense: true,
                              hintText: 'Search by price',
                              hintStyle:
                                  TextDefine.t2_R.copyWith(color: neutral08),
                              prefixIcon:
                                  const Text('Price', style: TextDefine.t1_B),
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              prefixIconConstraints: const BoxConstraints(
                                  minHeight: 0, minWidth: 70),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Button(
                      onPressed: () {
                        onSearch(controller.name.text, controller.price.text);
                        Navigator.maybePop(context);
                      },
                      text: 'Search')
                ],
              ),
            ),
          );
        });
  }
}
