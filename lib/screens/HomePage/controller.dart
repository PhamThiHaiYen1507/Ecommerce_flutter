import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/category_data.dart';
import 'package:nws_yenpth1_ecommerce_flutter/providers/categoty_provider.dart';

class HomePageController extends GetxController {
  late final CategoryProvider _categoryProvider;
  late final Rx<List<CategoryData>> categoryList;
  late final Rx<List<CategoryData>> searchList;
  late final TextEditingController search;
  late final FocusNode searchFocus;
  late final RxBool loading;

  @override
  void onInit() {
    _categoryProvider = CategoryProvider();
    categoryList = Rx([]);
    searchList = Rx([]);
    search = TextEditingController();
    searchFocus = FocusNode();
    loading = RxBool(false);
    getAllCategory();
    super.onInit();
  }

  Future<void> getAllCategory() async {
    loading(true);
    categoryList.value = await _categoryProvider.getAllCategory();
    loading(false);
    searchList(categoryList.value);
  }

  void searchcategoty(String search) {
    if (categoryList.value.isNotEmpty && search.isNotEmpty) {
      final List<CategoryData> newList = [];

      final symbolContains = categoryList.value.where((element) =>
          (element.name ?? '').toUpperCase().contains(search.toUpperCase()));

      for (var element in symbolContains) {
        if (newList.firstWhereOrNull((e) => e.name == element.name) == null) {
          newList.add(element);
        }
      }
      searchList(newList);
    } else {
      searchList(categoryList.value);
    }
  }

  @override
  void onClose() {
    search.dispose();
    searchFocus.dispose();
    super.onClose();
  }
}
