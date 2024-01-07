import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class BottomSheetSearchController extends GetxController {
  late final TextEditingController name, price;
  @override
  void onInit() {
    name = TextEditingController();
    price = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    price.dispose();
    super.onClose();
  }
}
